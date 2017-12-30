//
//  PostsRequest.swift
//  WPSDK
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Posts
/// - Author Jack Song
/// - seeAlso
/// [List Posts](https://developer.wordpress.org/rest-api/reference/posts/#list-posts)
struct ListPosts<T> : WPRequest where T: PostProtocol {
    
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
    
    init(context: Context = .view,
            page: Int = 1,
            perPage: Int = 10,
            search: String? = nil,
            after: Date = Date(timeIntervalSince1970: 1),  // Cannot be 0 !!!
        author: [Int]? = nil,
        authorExclude: [Int]? = nil,
        before: Date = Date(),
        exclude: [Int]? = nil,
        include: [Int]? = nil,
        offset: Int? = nil,
        order: Order = .desc,
        orderby: OrderBy = .date,
        slug: String? = nil,
        status: Status = .publish,
        categories: [Int]? = nil,
        categoriesExclude: [Int]? = nil) {
    
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withFullTime, .withFractionalSeconds, .withTimeZone]
        
        self.context = context
        self.page = page
        self.per_page = perPage
        self.search = search
        self.after = formatter.string(from: after)
        self.author = author
        self.author_exclude = authorExclude
        self.before = formatter.string(from: before)
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
struct CreateAPost<T> : WPRequest where T: PostProtocol {
    
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
struct RetrieveAPost<T> : WPRequest where T: PostProtocol {
    
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
struct UpdateAPost<T> : WPRequest where T: PostProtocol {
    
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
struct DeleteAPost<T> : WPRequest where T: PostProtocol {
    
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

enum Context: String, Codable {
    case view = "view"
    case embed = "embed"
    case edit = "edit"
}

enum Order: String, Codable {
    case asc = "asc"
    case desc = "desc"
}

enum OrderBy: String, Codable {
    case author = "author"
    case date = "date"
    case id = "id"
    case include = "include"
    case modified = "modified"
    case parent = "parent"
    case relevance = "relevance"
    case slug = "slug"
    case title = "title"
}

enum Status: String, Codable {
    case draft = "draft"
    case publish = "publish"
}

