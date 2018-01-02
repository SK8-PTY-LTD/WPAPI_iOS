//
//  CategoryRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Categories
/// - Author Jack Song
/// - seeAlso
/// [List Categories](https://developer.wordpress.org/rest-api/reference/categories/#list-categories)
struct ListCategories<T> : WPRequest where T : WPAPI {
    
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
    let order: Order?
    let orderby: OrderBy?
    let hide_empty: Bool?
    let parent: Int?
    let post: [Int]?
    let slug: String?
    
    init(context: Context? = nil,
        page: Int? = nil,
        perPage: Int? = nil,
        search: String? = nil,
        exclude: [Int]? = nil,
        include: [Int]? = nil,
        order: Order? = nil,
        orderby: OrderBy? = nil,
        hideEmpty: Bool? = nil,
        parent: Int? = nil,
        post: [Int]? = nil,
        slug: String? = nil) {
        
        self.context = context
        self.page = page
        self.per_page = perPage
        self.search = search
        self.exclude = exclude
        self.include = include
        self.order = order
        self.orderby = orderby
        self.hide_empty = hideEmpty
        self.parent = parent
        self.post = post
        self.slug = slug
    }
}

/// Create a Category
/// - Author Jack Song
/// - seeAlso
/// [Create a Category](https://developer.wordpress.org/rest-api/reference/categories/#create-a-category)
struct CreateACategory<T> : WPRequest where T: WPAPI {
    
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
        return try? JSONEncoder().encode(category)
    }
    
    // Body
    let category: T
    
    init(category: T) {
        self.category = category
    }
}

/// Retrieve a Category
/// - Author Jack Song
/// - seeAlso
/// [Retrieve A Category](https://developer.wordpress.org/rest-api/reference/categories/#retrieve-a-category)
struct RetrieveACategory<T> : WPRequest where T : WPAPI {
    
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

/// Update a Category
/// - Author Jack Song
/// - seeAlso
/// [Update a Category](https://developer.wordpress.org/rest-api/reference/categories/#update-a-category)
struct UpdateACategory<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(category.id!)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(category)
    }
    
    // Body
    let category: Category
    
    init(category: Category) {
        self.category = category
    }
}

/// Delete a Category
/// - Author Jack Song
/// - seeAlso
/// [Delete a Category](https://developer.wordpress.org/rest-api/reference/categories/#delete-a-category)
struct DeleteACategory<T> : WPRequest where T : WPAPI {
    
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

