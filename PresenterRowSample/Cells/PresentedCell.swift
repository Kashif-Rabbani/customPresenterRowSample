//
//  PresentedCell.swift
//  PresenterRowSample


import UIKit
//
// MARK: - Track Cell Delegate Protocol
//
protocol PresentedCellDelegate {
  func cancelTapped(_ cell: PresentedCell)
  func downloadTapped(_ cell: PresentedCell)
  func pauseTapped(_ cell: PresentedCell)
  func resumeTapped(_ cell: PresentedCell)
}

class PresentedCell: UITableViewCell {
    //
    // MARK: - Class Constants
    //
    static let identifier = "presentedIdentifier"
    
    //
    // MARK: - IBOutlets
    //

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    
    
      //
      // MARK: - Variables And Properties
      //
      
      /// Delegate identifies track for this cell, then
      /// passes this to a download service method.
      var delegatePC: PresentedCellDelegate?
      
      //
      // MARK: - IBActions
      //
      @IBAction func cancelTapped(_ sender: AnyObject) {
        delegatePC?.cancelTapped(self)
      }
      
      @IBAction func downloadTapped(_ sender: AnyObject) {
        delegatePC?.downloadTapped(self)
        print("Download Tapped")
      }
      
      @IBAction func pauseOrResumeTapped(_ sender: AnyObject) {
        if(pauseButton.titleLabel?.text == "Pause") {
          delegatePC?.pauseTapped(self)
        } else {
          delegatePC?.resumeTapped(self)
        }
      }
      
      //
      // MARK: - Internal Methods
      //
      func configure(track: HadithResource, downloaded: Bool, download: DownloadHadithResource?) {
        titleLabel.text = track.name
        artistLabel.text = track.nameUrdu
        
        // Show/hide download controls Pause/Resume, Cancel buttons, progress info.
        var showDownloadControls = false
        
        // Non-nil Download object means a download is in progress.
        if let download = download {
          showDownloadControls = true
          
          let title = download.isDownloading ? "Pause" : "Resume"
          pauseButton.setTitle(title, for: .normal)
          
          progressLabel.text = download.isDownloading ? "Downloading..." : "Paused"
        }
        
        pauseButton.isHidden = !showDownloadControls
        cancelButton.isHidden = !showDownloadControls
        
        progressView.isHidden = !showDownloadControls
        progressLabel.isHidden = !showDownloadControls
        
        // If the track is already downloaded, enable cell selection and hide the Download button.
        selectionStyle = downloaded ? UITableViewCell.SelectionStyle.gray : UITableViewCell.SelectionStyle.none
        downloadButton.isHidden = downloaded || showDownloadControls
      }
      
      func updateDisplay(progress: Float, totalSize : String) {
        progressView.progress = progress
        progressLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
      }
    
//    override func awakeFromNib() {
//         super.awakeFromNib()
//         // Initialization code
//     }
//
//     override func setSelected(_ selected: Bool, animated: Bool) {
//         super.setSelected(selected, animated: animated)
//
//         // Configure the view for the selected state
//     }
    }
