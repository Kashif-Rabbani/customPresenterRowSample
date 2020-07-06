
import Foundation.NSURL

//
// MARK: - HadithResource
//

class HadithResource {
    //
    // MARK: - Constants
    //
    
    var bookId: Int
    var name: String
    var nameUrdu: String
    var author: String
    var table: String
    var chaptersTable: String
    var skipChapters:Bool
    var hasEnglishTranslation:Bool
    var hadithCount: Int
    var previewURL: URL
    
    //
    // MARK: - Variables And Properties
    //
    var downloaded = false
    
    var urlPath = URL(string: "")
    //
    // MARK: - Initialization
    //
    init(bookId: Int, name: String, nameUrdu: String, author: String, table: String, chaptersTable: String, skipChapters:Bool, hasEnglishTranslation:Bool, hadithCount: Int, previewURL: URL) {
        self.bookId = bookId
        self.name = name
        self.nameUrdu = nameUrdu
        self.author = author
        self.table = table
        self.chaptersTable = chaptersTable
        self.skipChapters = skipChapters
        self.hasEnglishTranslation = hasEnglishTranslation
        self.hadithCount = hadithCount
        self.previewURL = previewURL
    }
    
}
