//
//  PostRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Posts
/// - Author Jack Song
/// - seeAlso
/// [List Posts](https://developer.wordpress.org/rest-api/reference/posts/#list-posts)
struct ListPosts<T> : WPRequest where T : WPAPI {
    
    typealias Response = [T]
    
    // Method
    var method: Method {
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
    let slug: String?
    let status: Status?
    let categories: [Int]?
    let categories_exclude: [Int]?
    
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
        slug: String? = nil,
        status: Status? = nil,
        categories: [Int]? = nil,
        categoriesExclude: [Int]? = nil) {
    
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withFullTime, .withTimeZone]
        
        self.context = context
        self.page = page
        self.per_page = perPage
        self.search = search
        if let after = after {
            self.after = formatter.string(from: after)
        } else {
            self.after = nil
        }
        self.author = author
        self.author_exclude = authorExclude
        if let before = before {
            self.before = formatter.string(from: before)
        } else {
            self.before = nil
        }
        self.exclude = exclude
        self.include = include
        self.offset = offset
        self.order = order
        self.orderby = orderby
        self.slug = slug
        self.status = status
        self.categories = categories
        self.categories_exclude = categoriesExclude
    }
}

/// Create a Post
/// - Author Jack Song
/// - seeAlso
/// [Create a Post](https://developer.wordpress.org/rest-api/reference/posts/#create-a-post)
struct CreateAPost<T> : WPRequest where T: WPAPI {
    
    typealias Response = T
    
    // Method
    var method: Method {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(post)
    }
    
    // Body
    let post: T
    
    init(post: T) {
        self.post = post
    }
}

/// Retrieve a Post
/// - Author Jack Song
/// - seeAlso
/// [Retrieve A Post](https://developer.wordpress.org/rest-api/reference/posts/#retrieve-a-post)
struct RetrieveAPost<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: Method {
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

/// Update a Post
/// - Author Jack Song
/// - seeAlso
/// [Update a Post](https://developer.wordpress.org/rest-api/reference/posts/#update-a-post)
struct UpdateAPost<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: Method {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(post.id!)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(post)
    }
    
    // Body
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
}

/// Delete a Post
/// - Author Jack Song
/// - seeAlso
/// [Delete a Post](https://developer.wordpress.org/rest-api/reference/posts/#delete-a-post)
struct DeleteAPost<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: Method {
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

