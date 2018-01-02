//
//  MediaRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Media
/// - Author Jack Song
/// - seeAlso
/// [List Media](https://developer.wordpress.org/rest-api/reference/media/#list-media)
struct ListMedia<T> : WPRequest where T : WPAPI {
    
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
    let before: String?
    let exclude: [Int]?
    let include: [Int]?
    let offset: Int?
    let order: Order?
    let orderby: OrderBy?
    let parent: [Int]?
    let parent_exclude: [Int]?
    let slug: String?
    let status: Status?
    let mediaType: MediaType?
    let mimeType: String?
    
    init(context: Context? = nil,
         page: Int? = nil,
         perPage: Int? = nil,
         search: String? = nil,
         after: Date? = nil,
         author: [Int]? = nil,
         authorExclude: [Int]? = nil,
         before: Date? = nil,
         exclude: [Int]? = nil,
         include: [Int]? = nil,
         offset: Int? = nil,
         order: Order? = nil,
         orderby: OrderBy? = nil,
         parent: [Int]? = nil,
         parentExclude: [Int]? = nil,
         slug: String? = nil,
         status: Status? = nil,
         mediaType: MediaType? = nil,
         mimeType: String? = nil) {
        
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
        self.slug = slug
        self.status = status
        self.mediaType = mediaType
        self.mimeType = mimeType
    }
}

/// Create a Media
/// - Author Jack Song
/// - seeAlso
/// [Create a Media](https://developer.wordpress.org/rest-api/reference/media/#create-a-media)
struct CreateAMedia<T> : WPRequest where T: WPAPI {
    
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
        return media.data
    }
    
    // Body
    let media: Media
    
    init(media: Media) {
        self.media = media
    }
}

/// Retrieve a Media
/// - Author Jack Song
/// - seeAlso
/// [Retrieve A Media](https://developer.wordpress.org/rest-api/reference/media/#retrieve-a-media)
struct RetrieveAMedia<T> : WPRequest where T : WPAPI {
    
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

/// Update a Media
/// - Author Jack Song
/// - seeAlso
/// [Update a Media](https://developer.wordpress.org/rest-api/reference/media/#update-a-media)
struct UpdateAMedia<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(media.id!)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(media)
    }
    
    // Body
    let media: Media
    
    init(media: Media) {
        self.media = media
    }
}

/// Delete a Media
/// - Author Jack Song
/// - seeAlso
/// [Delete a Media](https://developer.wordpress.org/rest-api/reference/media/#delete-a-media)
struct DeleteAMedia<T> : WPRequest where T : WPAPI {
    
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

