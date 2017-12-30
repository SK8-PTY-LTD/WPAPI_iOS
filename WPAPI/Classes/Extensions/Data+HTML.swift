//
//  Data+HTML.swift
//  WPSDK
//
//  Created by SongXujie on 27/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

// MARK: - Extension for HTML String
// seeAlso:
// [Swift extension example](https://stackoverflow.com/questions/33942483/swift-extension-example)
// - Author: Jack
extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

