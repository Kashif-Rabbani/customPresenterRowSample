//
//  SelectableViewController.swift
//  PresenterRowSample
//
//  Created by Alfredo Luco on 13-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import UIKit
import Eureka

public class SelectableViewController: UIViewController, TypedRowControllerType {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //
    // MARK: - Constants
    //
    /// Get local file path: download task stores tune here; AV player plays it.
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    let downloadService = DownloadServiceHadithResource()
    var hadithBooksDetails = [HadithResource]()
    
    //
    // MARK: - Variables And Properties
    //
    lazy var downloadsSession: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier:
            "com.kashifrabbani.islamone.bgSession.tafseerDownload")
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    
    //
    // MARK: - Internal Methods
    //
    
    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
    
    //MARK: - Variables
    //open var images: [String] = []
    public var row: RowOf<String>!
    public var onDismissCallback: ((UIViewController) -> Void)?
    
    //MARK: - Init
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    open override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
    }

    public convenience init(){
        let name = String(describing: SelectableViewController.self)
        let bundle = Bundle(for: SelectableViewController.self)
        print(name)
        print(bundle)
        self.init(nibName: name, bundle: bundle)
    
        self.loadViewIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Choose"
        downloadService.downloadsSession = downloadsSession
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        hadithBooksDetails = Utils.init().getAllHadith()
        
        self.tableView.register(UINib(nibName: "PresentedCell", bundle: Bundle(for: PresentedCell.self)), forCellReuseIdentifier: PresentedCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension SelectableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func reload(_ row: Int) {
          tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
      }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hadithBooksDetails.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PresentedCell = tableView.dequeueReusableCell(withIdentifier: PresentedCell.identifier,
                                                                for: indexPath) as! PresentedCell
        
        // Delegate cell button tap events to this view controller.
        cell.delegatePC = self
        
        let track = hadithBooksDetails[indexPath.row]
        
        let url = localFilePath(for: track.previewURL)
        track.downloaded = checkFileExistence(documentUrl: url)
        
        if(track.downloaded){
            track.urlPath = url
        }
        
        cell.configure(track: track,
                       downloaded: track.downloaded,
                       download: downloadService.activeDownloads[track.previewURL])
        
        return cell
        //        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as? PresentedCell{
        //            cell.artistLabel.text = "kashif"
        //            print(self.images[indexPath.row])
        //            //cell.iconImageView.image = UIImage(named: self.images[indexPath.row])
        //            return cell
        //        }
        //        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let value = self.hadithBooksDetails[indexPath.row].nameUrdu
        self.row.value = value
        self.row.updateCell()
        guard let callback = self.onDismissCallback else{ return }
        callback(self)
    }
    
    func checkFileExistence(documentUrl: URL) -> Bool {
        
        let fileManager:FileManager = FileManager.default
        
        //here check if file already exists on simulator
        if fileManager.fileExists(atPath: (documentUrl.path)) {
            print("File exists!")
            return true
        } else {
            return false
        }
        
    }
    
}



//
// MARK: - Presented Cell delegate
//
extension SelectableViewController: PresentedCellDelegate {
    func cancelTapped(_ cell: PresentedCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let track = hadithBooksDetails[indexPath.row]
            downloadService.cancelDownload(track)
            track.downloaded = false
            reload(indexPath.row)
        }
    }
    
    func downloadTapped(_ cell: PresentedCell) {
        print("Download Tapped")
        if let indexPath = tableView.indexPath(for: cell) {
            let track = hadithBooksDetails[indexPath.row]
            downloadService.startDownload(track)
            reload(indexPath.row)
        }
    }
    
    func pauseTapped(_ cell: PresentedCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let track = hadithBooksDetails[indexPath.row]
            downloadService.pauseDownload(track)
            reload(indexPath.row)
        }
    }
    
    func resumeTapped(_ cell: PresentedCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let track = hadithBooksDetails[indexPath.row]
            downloadService.resumeDownload(track)
            reload(indexPath.row)
        }
    }
}


//
// MARK: - URL Session Download Delegate
//
extension SelectableViewController: URLSessionDownloadDelegate {
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                           didFinishDownloadingTo location: URL) {
        // 1
        guard let sourceURL = downloadTask.originalRequest?.url else {
            return
        }
        
        let download = downloadService.activeDownloads[sourceURL]
        downloadService.activeDownloads[sourceURL] = nil
        
        // 2
        let destinationURL = localFilePath(for: sourceURL)
        print(destinationURL)
        
        // 3
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
            download?.track.downloaded = true
        } catch let error {
            print("Could not copy file to disk: \(error.localizedDescription)")
        }
        
        // 4
        if let index = download?.track.bookId {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
            }
        }
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                           didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                           totalBytesExpectedToWrite: Int64) {
        // 1
        guard
            let url = downloadTask.originalRequest?.url,
            let download = downloadService.activeDownloads[url]  else {
                return
        }
        
        // 2
        download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        // 3
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
        
        // 4
        DispatchQueue.main.async {
            if let trackCell = self.tableView.cellForRow(at: IndexPath(row: download.track.bookId,
                                                                       section: 0)) as? PresentedCell {
                trackCell.updateDisplay(progress: download.progress, totalSize: totalSize)
            }
        }
    }
}
