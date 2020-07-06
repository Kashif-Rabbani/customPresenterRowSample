
import Foundation

//
// MARK: - Download
//
class DownloadHadithResource {
  //
  // MARK: - Variables And Properties
  //
  var isDownloading = false
  var progress: Float = 0
  var resumeData: Data?
  var task: URLSessionDownloadTask?
  var track: HadithResource
  
  //
  // MARK: - Initialization
  //
  init(track: HadithResource) {
    self.track = track
  }
}
