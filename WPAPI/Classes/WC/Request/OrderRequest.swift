//
//  OrderRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// List Orders
/// - Author Jack Song
/// - seeAlso
/// [List Orders](http://woocommerce.github.io/woocommerce-rest-api-docs/#list-all-orders)
struct ListOrders : WPRequest {
    
    typealias Response = [WCOrder]
    
    // Method
    var method: WPMethod {
        return .get
    }
    
    // Path name
    var pathName: String {
        return "/wc/v2/orders"
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
    let before: String?
    let exclude: [Int]?
    let include: [Int]?
    let offset: Int?
    let order: Order?
    let orderby: OrderBy?
    let parent: [Int]?
    let parent_exclude: [Int]?
    let status: WCStatus?
    let categories: [Int]?
    let categories_exclude: [Int]?
    
    init(context: Context? = nil,
        page: Int? = nil,
        perPage: Int? = nil,
        search: String? = nil,
        after: Date? = nil,
        before: Date? = nil,
        exclude: [Int]? = nil,
        include: [Int]? = nil,
        offset: Int? = nil,
        order: Order? = nil,
        orderby: OrderBy? = nil,
        parent: [Int]? = nil,
        parent_exclude: [Int]? = nil,
        status: WCStatus? = nil,
        categories: [Int]? = nil,
        categoriesExclude: [Int]? = nil) {
        
        self.context = context
        self.page = page
        self.per_page = perPage
        self.search = search
        if let after = after {
            self.after = WP.dateFormatter.string(from: after)
        } else {
            self.after = nil
        }
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
        self.parent_exclude = parent_exclude
        self.status = status
        self.categories = categories
        self.categories_exclude = categoriesExclude
    }
}

/// Create a Order
/// - Author Jack Song
/// - seeAlso
/// [Create a Order](http://woocommerce.github.io/woocommerce-rest-api-docs/#create-an-order)
struct CreateAOrder : WPRequest {
    
    typealias Response = WCOrder
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wc/v2/orders"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(order)
    }
    
    // Body
    let order: WCOrder
    
    init(order: WCOrder) {
        self.order = order
    }
}

/// Retrieve a Order
/// - Author Jack Song
/// - seeAlso
/// [Retrieve A Order](http://woocommerce.github.io/woocommerce-rest-api-docs/#retrieve-an-order)
struct RetrieveAOrder : WPRequest {
    
    typealias Response = WCOrder
    
    // Method
    var method: WPMethod {
        return .get
    }
    
    // Path name
    var pathName: String {
        return "/wc/v2/orders/\(id)"
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

/// Update a Order
/// - Author Jack Song
/// - seeAlso
/// [Update a Order](http://woocommerce.github.io/woocommerce-rest-api-docs/#update-an-order)
struct UpdateAOrder : WPRequest {
    
    typealias Response = WCOrder
    
    // Method
    var method: WPMethod {
        return .post
    }
    
    // Path name
    var pathName: String {
        return "/wc/v2/orders/\(order.id!)"
    }
    
    // Body
    var body: Data? {
        return try? JSONEncoder().encode(order)
    }
    
    // Body
    let order: WCOrder
    
    init(order: WCOrder) {
        self.order = order
    }
}

/// Delete a Order
/// - Author Jack Song
/// - seeAlso
/// [Delete a Order](http://woocommerce.github.io/woocommerce-rest-api-docs/#delete-an-order)
struct DeleteAOrder : WPRequest {
    
    typealias Response = WCOrder
    
    // Method
    var method: WPMethod {
        return .delete
    }
    
    // Path name
    var pathName: String {
        return "/wc/v2/orders/\(id)"
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

/// Batch update orders
/// - TODO
/// - Author Jack Song
/// - seeAlso
/// [Delete update orders](http://woocommerce.github.io/woocommerce-rest-api-docs/#batch-update-orders)

