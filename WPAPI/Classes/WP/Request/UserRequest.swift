//
//  UserRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Users
/// - Author Jack Song
/// - seeAlso
/// [List Users](https://developer.wordpress.org/rest-api/reference/users/#list-users)
struct ListUsers<T> : WPRequest where T : WPAPI {
    
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
    let slug: [String]?
    let roles: [Role]?
    
    init(context: Context? = nil,
        page: Int? = nil,
        perPage: Int? = nil,
        search: String? = nil,
        exclude: [Int]? = nil,
        include: [Int]? = nil,
        offset: Int? = nil,
        order: Order? = nil,
        orderby: OrderBy? = nil,
        slug: [String]? = nil,
        roles: [Role]? = nil) {
        
        self.context = context
        self.page = page
        self.per_page = perPage
        self.search = search
        self.exclude = exclude
        self.include = include
        self.offset = offset
        self.order = order
        self.orderby = orderby
        self.slug = slug
        self.roles = roles
    }
}

/// Create a User
/// - Author Jack Song
/// - seeAlso
/// [Create a User](https://developer.wordpress.org/rest-api/reference/users/#create-a-user)
struct CreateAUser<T> : WPRequest where T: WPAPI {
    
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
        return try? JSONEncoder().encode(user)
    }
    
    // Body
    let user: T
    
    init(user: T) {
        self.user = user
    }
}

/// Retrieve a User
/// - Author Jack Song
/// - seeAlso
/// [Retrieve A User](https://developer.wordpress.org/rest-api/reference/users/#retrieve-a-user)
struct RetrieveAUser<T> : WPRequest where T : WPAPI {
    
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

/// Retrieve Me
/// - Author Jack Song
/// - seeAlso
/// [Retrieve Me](https://developer.wordpress.org/rest-api/reference/users/#retrieve-a-user)
struct RetrieveMe<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .get
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/me"
    }
    
    // Body
    var body: Data? {
        return nil
    }
    
    // Body
    let context = "edit"
    
    init() {
    }
}

/// Update a User
/// - Author Jack Song
/// - seeAlso
/// [Update a User](https://developer.wordpress.org/rest-api/reference/users/#update-a-user)
struct UpdateAUser<T> : WPRequest where T : WPAPI {
    
    typealias Response = T
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wp/v2/\(T.endpoint)/\(user.id!)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(user)
    }
    
    // Body
    let user: User
    
    init(user: User) {
        self.user = user
    }
}

/// Delete a User
/// - Author Jack Song
/// - seeAlso
/// [Delete a User](https://developer.wordpress.org/rest-api/reference/users/#delete-a-user)
struct DeleteAUser<T> : WPRequest where T : WPAPI {
    
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

