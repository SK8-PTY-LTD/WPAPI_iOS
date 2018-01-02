//
//  CommentRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Comments
/// - Author Jack Song
/// - seeAlso
/// [List Comments](https://developer.wordpress.org/rest-api/reference/comments/#list-comments)
struct ListComments<T> : WPRequest where T : WPAPI {
    
    typealias Response = [T]
    
    // Method
    var method: WPMethod {
        return .get
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)"
    }
    
    // Body
    var body: Data? {
        return nil
    }
    
    // Parameters
    let context: Context?
    let page: Int?
    let per_page: Int?
    let search: String?
    let after: String?
    let author: [Int]?
    let author_exclude: [Int]?
    let author_email : String?
    let before: String?
    let exclude: [Int]?
    let include: [Int]?
    let offset: Int?
    let order: Order?
    let orderby: OrderBy?
    let parent : [Int]?
    let parent_exclude : [Int]?
    let post : [Int]?
    let status : String?
    let type : String?
    let password : String?
    
    init(context: Context? = nil,
         page: Int? = nil,
         perPage: Int? = nil,
         search: String? = nil,
         after: Date? = nil,
         author: [Int]? = nil,
         authorExclude: [Int]? = nil,
         authorEmail: String? = nil,
         before: Date? = nil,
         exclude: [Int]? = nil,
         include: [Int]? = nil,
         offset: Int? = nil,
         order: Order? = nil,
         orderby: OrderBy? = nil,
         parent: [Int]?,
         parentExclude: [Int]?,
         post: [Int]?,
         status: String?,
         type: String?,
         password: String?) {
        
        self.context = context
        self.page = page
        self.per_page = perPage
        self.search = search
        if let after = after {
            self.after = WP.dateFormatter.string(from: after)
        } else {
            self.after = nil
        }
        self.author = author
        self.author_exclude = authorExclude
        self.author_email = authorEmail
        if let before = before {
            self.before = WP.dateFormatter.string(from: before)
        } else {
            self.before = nil
        }
        self.exclude = exclude
        self.include = include
        self.offset = offset
        self.order = order
        self.orderby = orderby
        self.parent = parent
        self.parent_exclude = parentExclude
        self.post = post
        self.status = status
        self.type = type
        self.password = password
    }
}

/// Create a Comment
/// - Author Jack Song
/// - seeAlso
/// [Create a Comment](https://developer.wordpress.org/rest-api/reference/comments/#create-a-comment)
struct CreateAComment<T> : WPRequest where T: WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(comment)
    }
    
    // Body
    let comment: T
    
    init(comment: T) {
        self.comment = comment
    }
}

/// Retrieve a Comment
/// - Author Jack Song
/// - seeAlso
/// [Retrieve A Comment](https://developer.wordpress.org/rest-api/reference/comments/#retrieve-a-comment)
struct RetrieveAComment<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .get
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(id)"
    }
    
    // Body
    var body: Data? {
        return nil
    }
    
    // Body
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}

/// Update a Comment
/// - Author Jack Song
/// - seeAlso
/// [Update a Comment](https://developer.wordpress.org/rest-api/reference/comments/#update-a-comment)
struct UpdateAComment<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(comment.id!)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(comment)
    }
    
    // Body
    let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
}

/// Delete a Comment
/// - Author Jack Song
/// - seeAlso
/// [Delete a Comment](https://developer.wordpress.org/rest-api/reference/comments/#delete-a-comment)
struct DeleteAComment<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .delete
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(id)"
    }
    
    // Body
    var body: Data? {
        if let force = force {
            let body = ["force": force]
            return try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        } else {
            return nil
        }
    }
    
    // Body
    let id: Int
    let force: Bool?
    
    init(id: Int, force: Bool? = false) {
        self.id = id
        self.force = force
    }
}

