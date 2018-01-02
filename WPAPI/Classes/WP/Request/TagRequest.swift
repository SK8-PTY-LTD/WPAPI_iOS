//
//  TagRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Tags
/// - Author Jack Song
/// - seeAlso
/// [List Tags](https://developer.wordpress.org/rest-api/reference/tags/#list-tags)
struct ListTags<T> : WPRequest where T : WPAPI {
    
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
    let exclude: [Int]?
    let include: [Int]?
    let offset: Int?
    let order: Order?
    let orderby: OrderBy?
    let hide_empty: Bool?
    let post: [Int]?
    let slug: String?
    
    init(context: Context? = nil,
        page: Int? = nil,
        perPage: Int? = nil,
        search: String? = nil,
        exclude: [Int]? = nil,
        include: [Int]? = nil,
        offset: Int? = nil,
        order: Order? = nil,
        orderby: OrderBy? = nil,
        hideEmpty: Bool? = nil,
        post: [Int]? = nil,
        slug: String? = nil) {
        
        self.context = context
        self.page = page
        self.per_page = perPage
        self.search = search
        self.exclude = exclude
        self.include = include
        self.offset = offset
        self.order = order
        self.orderby = orderby
        self.hide_empty = hideEmpty
        self.post = post
        self.slug = slug
    }
}

/// Create a Tag
/// - Author Jack Song
/// - seeAlso
/// [Create a Tag](https://developer.wordpress.org/rest-api/reference/tags/#create-a-tag)
struct CreateATag<T> : WPRequest where T: WPAPI {
    
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
        return try? JSONEncoder().encode(tag)
    }
    
    // Body
    let tag: T
    
    init(tag: T) {
        self.tag = tag
    }
}

/// Retrieve a Tag
/// - Author Jack Song
/// - seeAlso
/// [Retrieve A Tag](https://developer.wordpress.org/rest-api/reference/tags/#retrieve-a-tag)
struct RetrieveATag<T> : WPRequest where T : WPAPI {
    
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

/// Update a Tag
/// - Author Jack Song
/// - seeAlso
/// [Update a Tag](https://developer.wordpress.org/rest-api/reference/tags/#update-a-tag)
struct UpdateATag<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(tag.id!)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(tag)
    }
    
    // Body
    let tag: Tag
    
    init(tag: Tag) {
        self.tag = tag
    }
}

/// Delete a Tag
/// - Author Jack Song
/// - seeAlso
/// [Delete a Tag](https://developer.wordpress.org/rest-api/reference/tags/#delete-a-tag)
struct DeleteATag<T> : WPRequest where T : WPAPI {
    
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

