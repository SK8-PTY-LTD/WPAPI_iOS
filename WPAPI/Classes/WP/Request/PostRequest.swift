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
    let perPage: Int?
    let search: String?
    let after: String?
    let author: Int?
    let authorExclude: [Int]?
    let before: String?
    let exclude: [Int]?
    let include: [Int]?
    let offset: Int?
    let order: Order?
    let orderby: OrderBy?
    let slug: String?
    let status: Status?
    let categories: [Int]?
    let categoriesExclude: [Int]?
    let tags: [String]?
    let tagsExclude: [String]?
    let sticky: Bool?
    let filters: [String: AnyObject]?
    
    init(context: Context? = nil,
        page: Int? = nil,
        perPage: Int? = nil,
        search: String? = nil,
        after: Date? = nil,
        author: Int? = nil,
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
        categoriesExclude: [Int]? = nil,
        tags: [String]?,
        tagsExclude: [String]?,
        sticky: Bool?,
        filters: [String: AnyObject]? = nil) {
        
        self.context = context
        self.page = page
        self.perPage = perPage
        self.search = search
        if let after = after {
            self.after = WP.dateFormatter.string(from: after)
        } else {
            self.after = nil
        }
        self.author = author
        self.authorExclude = authorExclude
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
        self.slug = slug
        self.status = status
        self.categories = categories
        self.categoriesExclude = categoriesExclude
        self.tags = tags
        self.tagsExclude = tagsExclude
        self.sticky = sticky
        self.filters = filters // Not default WordPress REST API, filter is enabled by [WP REST Filter](https://wordpress.org/plugins/wp-rest-filter/)
    }
    
    private struct CodingKeys: CodingKey {
        
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        init?(intValue: Int) {
            self.intValue = intValue;
            self.stringValue = "\(intValue)"
        }
        
//        static let context = "context"
//        static let page = "page"
//        static let perPage = "per_page"
//        static let search = "search"
//        static let after = "after"
//        static let author = "author"
//        static let authorExclude = "author_exclude"
//        static let before = "before"
//        static let exclude = "exclude"
//        static let include = "include"
//        static let offset = "offset"
//        static let order = "order"
//        static let orderBy = "orderby"
//        static let slug = "slug"
//        static let status = "status"
//        static let categories = "categories"
//        static let categoriesExclude = "categories_exclude"
//        static let tags = "tags"
//        static let tagsExclude = "tags_exclude"
//        static let sticky = "sticky"
        
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(context, forKey: CodingKeys(stringValue: "context")!)
        try container.encodeIfPresent(page, forKey: CodingKeys(stringValue: "page")!)
        try container.encodeIfPresent(perPage, forKey: CodingKeys(stringValue: "per_page")!)
        try container.encodeIfPresent(search, forKey: CodingKeys(stringValue: "search")!)
        try container.encodeIfPresent(after, forKey: CodingKeys(stringValue: "after")!)
        try container.encodeIfPresent(author, forKey: CodingKeys(stringValue: "author")!)
        try container.encodeIfPresent(authorExclude, forKey: CodingKeys(stringValue: "author_exclude")!)
        try container.encodeIfPresent(before, forKey: CodingKeys(stringValue: "before")!)
        try container.encodeIfPresent(exclude, forKey: CodingKeys(stringValue: "exclude")!)
        try container.encodeIfPresent(include, forKey: CodingKeys(stringValue: "include")!)
        try container.encodeIfPresent(offset, forKey: CodingKeys(stringValue: "offset")!)
        try container.encodeIfPresent(order, forKey: CodingKeys(stringValue: "order")!)
        try container.encodeIfPresent(orderby, forKey: CodingKeys(stringValue: "orderby")!)
        try container.encodeIfPresent(slug, forKey: CodingKeys(stringValue: "slug")!)
        try container.encodeIfPresent(status, forKey: CodingKeys(stringValue: "status")!)
        try container.encodeIfPresent(categories, forKey: CodingKeys(stringValue: "categories")!)
        try container.encodeIfPresent(categoriesExclude, forKey: CodingKeys(stringValue: "categories_exclude")!)
        try container.encodeIfPresent(tags, forKey: CodingKeys(stringValue: "tags")!)
        try container.encodeIfPresent(tagsExclude, forKey: CodingKeys(stringValue: "tags_exclude")!)
        try container.encodeIfPresent(sticky, forKey: CodingKeys(stringValue: "sticky")!)
        
         // Not default WordPress REST API, filter is enabled by [WP REST Filter](https://wordpress.org/plugins/wp-rest-filter/)
        if let filters = self.filters {
            var index = 0
            for (key, value) in filters {
                // Encode key
                try container.encodeIfPresent(key, forKey: CodingKeys(stringValue: "filter[meta_query][\(index)][key]")!)
                // Encode value, currently only single value, e.g. Date, Int, String & Bool is accepted. Array & Dictionary is not accepted
                // AdvancedValue: [expiry_date: ["value": "20181226T23:59:59", "compare": "="]]
                if let dateValue = value as? Date {
                    try container.encodeIfPresent(WP.dateFormatter.string(from: dateValue), forKey: CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                } else if let intValue = value as? Int {
                    try container.encodeIfPresent(intValue, forKey:CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                } else if let stringValue = value as? String {
                    try container.encodeIfPresent(stringValue, forKey:CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                } else if let boolValue = value as? Bool {
                    try container.encodeIfPresent(boolValue, forKey:CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                } else if let advancedValue = value as? [String: AnyObject] {
                    if let dateValue = advancedValue["value"] as? Date {
                        try container.encodeIfPresent(WP.dateFormatter.string(from: dateValue), forKey: CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                    } else if let intValue = advancedValue["value"] as? Int {
                        try container.encodeIfPresent(intValue, forKey:CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                    } else if let stringValue = advancedValue["value"] as? String {
                        try container.encodeIfPresent(stringValue, forKey:CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                    } else if let boolValue = advancedValue["value"] as? Bool {
                        try container.encodeIfPresent(boolValue, forKey:CodingKeys(stringValue: "filter[meta_query][\(index)][value]")!)
                    } else {
                        // Silence is gold
                    }
                    let compareValue = advancedValue["compare"] as! String
                    try container.encodeIfPresent(compareValue, forKey: CodingKeys(stringValue: "filter[meta_query][\(index)][compare]")!)
                } else {
                    // Silence is gold
                }
            index += 1
            }
        }
    }
}

/// Create a Post
/// - Author Jack Song
/// - seeAlso
/// [Create a Post](https://developer.wordpress.org/rest-api/reference/posts/#create-a-post)
struct CreateAPost<T> : WPRequest where T: WPAPI {
    
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

/// Update a Post
/// - Author Jack Song
/// - seeAlso
/// [Update a Post](https://developer.wordpress.org/rest-api/reference/posts/#update-a-post)
struct UpdateAPost<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
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

