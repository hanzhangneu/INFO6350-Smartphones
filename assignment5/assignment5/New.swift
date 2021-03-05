//
//  New.swift

import Foundation

class News{
    var author : String = ""
    var title : String = ""
    var description : String = ""
    
    init(author: String, title: String, description: String) {
        self.author = author
        self.title = title
        self.description = description
    }
}
