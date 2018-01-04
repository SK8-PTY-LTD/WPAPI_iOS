/*
 Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation

open class User : Codable, WPAPI {
    
    // Slug for end point
    open class var endpoint: String {
        return "users"
    }
    
    public let id : Int?
    public let username : String?
    public var name : String?
    public let firstName : String?
    public let lastName : String?
    public let email : String?
    public let url : String?
    public let description : String?
    public let link : String?
    public let locale : String?
    public let nickname : String?
    public let slug : String?
    public let roles : [String]?
    public let registeredDate : Date?
    public let capabilities : Capabilities?
    public let extraCapabilities : ExtraCapabilities?
    public let avatarUrls : AvatarUrls?
    public let meta : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case username = "username"
        case name = "name"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case url = "url"
        case description = "description"
        case link = "link"
        case locale = "locale"
        case nickname = "nickname"
        case slug = "slug"
        case roles = "roles"
        case registered_date = "registered_date"
        case capabilities = "capabilities"
        case extra_capabilities = "extra_capabilities"
        case avatar_urls = "avatar_urls"
        case meta = "meta"
    }
    
    public required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        firstName = try values.decodeIfPresent(String.self, forKey: .first_name)
        lastName = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        locale = try values.decodeIfPresent(String.self, forKey: .locale)
        nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        roles = try values.decodeIfPresent([String].self, forKey: .roles)
        
        let ds = ((try values.decodeIfPresent(String.self, forKey: .registered_date)))
        if ds != nil {
            registeredDate = WP.dateFormatter.date(from: ds!)
        }else{
            registeredDate = nil
        }
        
        capabilities = try values.decodeIfPresent(Capabilities.self, forKey: .capabilities)
        extraCapabilities = try values.decodeIfPresent(ExtraCapabilities.self, forKey: .extra_capabilities)
        avatarUrls = try values.decodeIfPresent(AvatarUrls.self, forKey: .avatar_urls)
        meta = try values.decodeIfPresent([String].self, forKey: .meta)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(username, forKey: .username)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(firstName, forKey: .first_name)
        try container.encodeIfPresent(lastName, forKey: .last_name)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(nickname, forKey: .nickname)
        try container.encodeIfPresent(slug, forKey: .slug)
        try container.encodeIfPresent(roles, forKey: .roles)
        try container.encodeIfPresent(WP.dateFormatter.string(from: registeredDate!), forKey: .registered_date)
        try container.encodeIfPresent(capabilities, forKey: .capabilities)
        try container.encodeIfPresent(extraCapabilities, forKey: .extra_capabilities)
        try container.encodeIfPresent(avatarUrls, forKey: .avatar_urls)
        try container.encodeIfPresent(meta, forKey: .meta)
    }
    
    /// <#Description#>
    ///
    /// - Author: Jack
    /// - seeAlso
    ///   [List Users](https://developer.wordpress.org/rest-api/reference/users/#list-users)
    /// - Parameters:
    ///   - context: Scope under which the request is made; determines fields present in response.
    ///   - page: Current page of the collection.
    ///   - perPage: Maximum number of items to be returned in result set.
    ///   - search: Limit results to those matching a string.
    ///   - after: Limit response to users published after a given ISO8601 compliant date.
    ///   - author: Limit result set to users assigned to specific authors.
    ///   - authorExclude: Ensure result set excludes users assigned to specific authors.
    ///   - before: Limit response to users published before a given ISO8601 compliant date.
    ///   - exclude: Ensure result set excludes specific IDs.
    ///   - include: Limit result set to specific IDs.
    ///   - offset: Offset the result set by a specific number of items.
    ///   - order: Order sort attribute ascending or descending.
    ///   - orderby: Sort collection by object attribute.
    ///   - slug: Limit result set to users with one or more specific slugs.
    ///   - status: Limit result set to users assigned one or more statuses.
    ///   - categories: Limit result set to all items that have the specified term assigned in the categories taxonomy.
    ///   - categoriesExclude:     Limit result set to all items except those that have the specified term assigned in the categories taxonomy.
    ///   - completion: Completion handle
    public static func list<T>(context: Context? = nil,
                               page: Int? = nil,
                               perPage: Int? = nil,
                               search: String? = nil,
                               exclude: [Int]? = nil,
                               include: [Int]? = nil,
                               offset: Int? = nil,
                               order: Order? = nil,
                               orderby: OrderBy? = nil,
                               slug: [String]? = nil,
                               roles: [Role]? = nil,
                               completion: @escaping ResultCallback<[T]>) where T : WPAPI {
        
        let request = ListUsers<T>(context: context,
                                   page: page,
                                   perPage: perPage,
                                   search: search,
                                   exclude: exclude,
                                   include: include,
                                   offset: offset,
                                   order: order,
                                   orderby: orderby,
                                   slug: slug,
                                   roles: roles)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    public func save<T>(completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if self.id != nil {
            
            // ID exists, Update A User
            let request = UpdateAUser<T>(user: self)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let user):
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            
            // ID does not exist, Create A User
            let request = CreateAUser<T>(user: self as! T)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let user):
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    public static func get<T>(id: Int, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        let request = RetrieveAUser<T>(id: id)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public static func getMe<T>(completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        let request = RetrieveMe<T>()
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func delete<T>(force: Bool? = false, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if let id = self.id {
            let request = DeleteAUser<T>(id: id, force: force)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let user):
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(WPError.client(message: "Current user object is not saved on server yet, therefore cannot be deleted", code: .MISSING_OBJECT_ID)))
        }
        
    }
    
}

public struct Capabilities : Codable {
    let switch_themes : Bool?
    let edit_themes : Bool?
    let activate_plugins : Bool?
    let edit_plugins : Bool?
    let edit_users : Bool?
    let edit_files : Bool?
    let manage_options : Bool?
    let moderate_users : Bool?
    let manage_categories : Bool?
    let manage_links : Bool?
    let upload_files : Bool?
    //    let import : Bool?
    let unfiltered_html : Bool?
    let edit_posts : Bool?
    let edit_others_posts : Bool?
    let edit_published_posts : Bool?
    let publish_posts : Bool?
    let edit_pages : Bool?
    let read : Bool?
    let level_10 : Bool?
    let level_9 : Bool?
    let level_8 : Bool?
    let level_7 : Bool?
    let level_6 : Bool?
    let level_5 : Bool?
    let level_4 : Bool?
    let level_3 : Bool?
    let level_2 : Bool?
    let level_1 : Bool?
    let level_0 : Bool?
    let edit_others_pages : Bool?
    let edit_published_pages : Bool?
    let publish_pages : Bool?
    let delete_pages : Bool?
    let delete_others_pages : Bool?
    let delete_published_pages : Bool?
    let delete_posts : Bool?
    let delete_others_posts : Bool?
    let delete_published_posts : Bool?
    let delete_private_posts : Bool?
    let edit_private_posts : Bool?
    let read_private_posts : Bool?
    let delete_private_pages : Bool?
    let edit_private_pages : Bool?
    let read_private_pages : Bool?
    let delete_users : Bool?
    let create_users : Bool?
    let unfiltered_upload : Bool?
    let edit_dashboard : Bool?
    let update_plugins : Bool?
    let delete_plugins : Bool?
    let install_plugins : Bool?
    let update_themes : Bool?
    let install_themes : Bool?
    let update_core : Bool?
    let list_users : Bool?
    let remove_users : Bool?
    let promote_users : Bool?
    let edit_theme_options : Bool?
    let delete_themes : Bool?
    let export : Bool?
    let copy_posts : Bool?
    let wpseo_bulk_edit : Bool?
    let enable_cometchat : Bool?
    let run_adminer : Bool?
    let manage_woocommerce : Bool?
    let view_woocommerce_reports : Bool?
    let edit_product : Bool?
    let read_product : Bool?
    let delete_product : Bool?
    let edit_products : Bool?
    let edit_others_products : Bool?
    let publish_products : Bool?
    let read_private_products : Bool?
    let delete_products : Bool?
    let delete_private_products : Bool?
    let delete_published_products : Bool?
    let delete_others_products : Bool?
    let edit_private_products : Bool?
    let edit_published_products : Bool?
    let manage_product_terms : Bool?
    let edit_product_terms : Bool?
    let delete_product_terms : Bool?
    let assign_product_terms : Bool?
    let edit_shop_order : Bool?
    let read_shop_order : Bool?
    let delete_shop_order : Bool?
    let edit_shop_orders : Bool?
    let edit_others_shop_orders : Bool?
    let publish_shop_orders : Bool?
    let read_private_shop_orders : Bool?
    let delete_shop_orders : Bool?
    let delete_private_shop_orders : Bool?
    let delete_published_shop_orders : Bool?
    let delete_others_shop_orders : Bool?
    let edit_private_shop_orders : Bool?
    let edit_published_shop_orders : Bool?
    let manage_shop_order_terms : Bool?
    let edit_shop_order_terms : Bool?
    let delete_shop_order_terms : Bool?
    let assign_shop_order_terms : Bool?
    let edit_shop_coupon : Bool?
    let read_shop_coupon : Bool?
    let delete_shop_coupon : Bool?
    let edit_shop_coupons : Bool?
    let edit_others_shop_coupons : Bool?
    let publish_shop_coupons : Bool?
    let read_private_shop_coupons : Bool?
    let delete_shop_coupons : Bool?
    let delete_private_shop_coupons : Bool?
    let delete_published_shop_coupons : Bool?
    let delete_others_shop_coupons : Bool?
    let edit_private_shop_coupons : Bool?
    let edit_published_shop_coupons : Bool?
    let manage_shop_coupon_terms : Bool?
    let edit_shop_coupon_terms : Bool?
    let delete_shop_coupon_terms : Bool?
    let assign_shop_coupon_terms : Bool?
    let edit_shop_webhook : Bool?
    let read_shop_webhook : Bool?
    let delete_shop_webhook : Bool?
    let edit_shop_webhooks : Bool?
    let edit_others_shop_webhooks : Bool?
    let publish_shop_webhooks : Bool?
    let read_private_shop_webhooks : Bool?
    let delete_shop_webhooks : Bool?
    let delete_private_shop_webhooks : Bool?
    let delete_published_shop_webhooks : Bool?
    let delete_others_shop_webhooks : Bool?
    let edit_private_shop_webhooks : Bool?
    let edit_published_shop_webhooks : Bool?
    let manage_shop_webhook_terms : Bool?
    let edit_shop_webhook_terms : Bool?
    let delete_shop_webhook_terms : Bool?
    let assign_shop_webhook_terms : Bool?
    let wpseo_manage_options : Bool?
    let administrator : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case switch_themes = "switch_themes"
        case edit_themes = "edit_themes"
        case activate_plugins = "activate_plugins"
        case edit_plugins = "edit_plugins"
        case edit_users = "edit_users"
        case edit_files = "edit_files"
        case manage_options = "manage_options"
        case moderate_users = "moderate_users"
        case manage_categories = "manage_categories"
        case manage_links = "manage_links"
        case upload_files = "upload_files"
        //        case import = "import"
        case unfiltered_html = "unfiltered_html"
        case edit_posts = "edit_posts"
        case edit_others_posts = "edit_others_posts"
        case edit_published_posts = "edit_published_posts"
        case publish_posts = "publish_posts"
        case edit_pages = "edit_pages"
        case read = "read"
        case level_10 = "level_10"
        case level_9 = "level_9"
        case level_8 = "level_8"
        case level_7 = "level_7"
        case level_6 = "level_6"
        case level_5 = "level_5"
        case level_4 = "level_4"
        case level_3 = "level_3"
        case level_2 = "level_2"
        case level_1 = "level_1"
        case level_0 = "level_0"
        case edit_others_pages = "edit_others_pages"
        case edit_published_pages = "edit_published_pages"
        case publish_pages = "publish_pages"
        case delete_pages = "delete_pages"
        case delete_others_pages = "delete_others_pages"
        case delete_published_pages = "delete_published_pages"
        case delete_posts = "delete_posts"
        case delete_others_posts = "delete_others_posts"
        case delete_published_posts = "delete_published_posts"
        case delete_private_posts = "delete_private_posts"
        case edit_private_posts = "edit_private_posts"
        case read_private_posts = "read_private_posts"
        case delete_private_pages = "delete_private_pages"
        case edit_private_pages = "edit_private_pages"
        case read_private_pages = "read_private_pages"
        case delete_users = "delete_users"
        case create_users = "create_users"
        case unfiltered_upload = "unfiltered_upload"
        case edit_dashboard = "edit_dashboard"
        case update_plugins = "update_plugins"
        case delete_plugins = "delete_plugins"
        case install_plugins = "install_plugins"
        case update_themes = "update_themes"
        case install_themes = "install_themes"
        case update_core = "update_core"
        case list_users = "list_users"
        case remove_users = "remove_users"
        case promote_users = "promote_users"
        case edit_theme_options = "edit_theme_options"
        case delete_themes = "delete_themes"
        case export = "export"
        case copy_posts = "copy_posts"
        case wpseo_bulk_edit = "wpseo_bulk_edit"
        case enable_cometchat = "enable_cometchat"
        case run_adminer = "run_adminer"
        case manage_woocommerce = "manage_woocommerce"
        case view_woocommerce_reports = "view_woocommerce_reports"
        case edit_product = "edit_product"
        case read_product = "read_product"
        case delete_product = "delete_product"
        case edit_products = "edit_products"
        case edit_others_products = "edit_others_products"
        case publish_products = "publish_products"
        case read_private_products = "read_private_products"
        case delete_products = "delete_products"
        case delete_private_products = "delete_private_products"
        case delete_published_products = "delete_published_products"
        case delete_others_products = "delete_others_products"
        case edit_private_products = "edit_private_products"
        case edit_published_products = "edit_published_products"
        case manage_product_terms = "manage_product_terms"
        case edit_product_terms = "edit_product_terms"
        case delete_product_terms = "delete_product_terms"
        case assign_product_terms = "assign_product_terms"
        case edit_shop_order = "edit_shop_order"
        case read_shop_order = "read_shop_order"
        case delete_shop_order = "delete_shop_order"
        case edit_shop_orders = "edit_shop_orders"
        case edit_others_shop_orders = "edit_others_shop_orders"
        case publish_shop_orders = "publish_shop_orders"
        case read_private_shop_orders = "read_private_shop_orders"
        case delete_shop_orders = "delete_shop_orders"
        case delete_private_shop_orders = "delete_private_shop_orders"
        case delete_published_shop_orders = "delete_published_shop_orders"
        case delete_others_shop_orders = "delete_others_shop_orders"
        case edit_private_shop_orders = "edit_private_shop_orders"
        case edit_published_shop_orders = "edit_published_shop_orders"
        case manage_shop_order_terms = "manage_shop_order_terms"
        case edit_shop_order_terms = "edit_shop_order_terms"
        case delete_shop_order_terms = "delete_shop_order_terms"
        case assign_shop_order_terms = "assign_shop_order_terms"
        case edit_shop_coupon = "edit_shop_coupon"
        case read_shop_coupon = "read_shop_coupon"
        case delete_shop_coupon = "delete_shop_coupon"
        case edit_shop_coupons = "edit_shop_coupons"
        case edit_others_shop_coupons = "edit_others_shop_coupons"
        case publish_shop_coupons = "publish_shop_coupons"
        case read_private_shop_coupons = "read_private_shop_coupons"
        case delete_shop_coupons = "delete_shop_coupons"
        case delete_private_shop_coupons = "delete_private_shop_coupons"
        case delete_published_shop_coupons = "delete_published_shop_coupons"
        case delete_others_shop_coupons = "delete_others_shop_coupons"
        case edit_private_shop_coupons = "edit_private_shop_coupons"
        case edit_published_shop_coupons = "edit_published_shop_coupons"
        case manage_shop_coupon_terms = "manage_shop_coupon_terms"
        case edit_shop_coupon_terms = "edit_shop_coupon_terms"
        case delete_shop_coupon_terms = "delete_shop_coupon_terms"
        case assign_shop_coupon_terms = "assign_shop_coupon_terms"
        case edit_shop_webhook = "edit_shop_webhook"
        case read_shop_webhook = "read_shop_webhook"
        case delete_shop_webhook = "delete_shop_webhook"
        case edit_shop_webhooks = "edit_shop_webhooks"
        case edit_others_shop_webhooks = "edit_others_shop_webhooks"
        case publish_shop_webhooks = "publish_shop_webhooks"
        case read_private_shop_webhooks = "read_private_shop_webhooks"
        case delete_shop_webhooks = "delete_shop_webhooks"
        case delete_private_shop_webhooks = "delete_private_shop_webhooks"
        case delete_published_shop_webhooks = "delete_published_shop_webhooks"
        case delete_others_shop_webhooks = "delete_others_shop_webhooks"
        case edit_private_shop_webhooks = "edit_private_shop_webhooks"
        case edit_published_shop_webhooks = "edit_published_shop_webhooks"
        case manage_shop_webhook_terms = "manage_shop_webhook_terms"
        case edit_shop_webhook_terms = "edit_shop_webhook_terms"
        case delete_shop_webhook_terms = "delete_shop_webhook_terms"
        case assign_shop_webhook_terms = "assign_shop_webhook_terms"
        case wpseo_manage_options = "wpseo_manage_options"
        case administrator = "administrator"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        switch_themes = try values.decodeIfPresent(Bool.self, forKey: .switch_themes)
        edit_themes = try values.decodeIfPresent(Bool.self, forKey: .edit_themes)
        activate_plugins = try values.decodeIfPresent(Bool.self, forKey: .activate_plugins)
        edit_plugins = try values.decodeIfPresent(Bool.self, forKey: .edit_plugins)
        edit_users = try values.decodeIfPresent(Bool.self, forKey: .edit_users)
        edit_files = try values.decodeIfPresent(Bool.self, forKey: .edit_files)
        manage_options = try values.decodeIfPresent(Bool.self, forKey: .manage_options)
        moderate_users = try values.decodeIfPresent(Bool.self, forKey: .moderate_users)
        manage_categories = try values.decodeIfPresent(Bool.self, forKey: .manage_categories)
        manage_links = try values.decodeIfPresent(Bool.self, forKey: .manage_links)
        upload_files = try values.decodeIfPresent(Bool.self, forKey: .upload_files)
        //        import = try values.decodeIfPresent(Bool.self, forKey: .import)
        unfiltered_html = try values.decodeIfPresent(Bool.self, forKey: .unfiltered_html)
        edit_posts = try values.decodeIfPresent(Bool.self, forKey: .edit_posts)
        edit_others_posts = try values.decodeIfPresent(Bool.self, forKey: .edit_others_posts)
        edit_published_posts = try values.decodeIfPresent(Bool.self, forKey: .edit_published_posts)
        publish_posts = try values.decodeIfPresent(Bool.self, forKey: .publish_posts)
        edit_pages = try values.decodeIfPresent(Bool.self, forKey: .edit_pages)
        read = try values.decodeIfPresent(Bool.self, forKey: .read)
        level_10 = try values.decodeIfPresent(Bool.self, forKey: .level_10)
        level_9 = try values.decodeIfPresent(Bool.self, forKey: .level_9)
        level_8 = try values.decodeIfPresent(Bool.self, forKey: .level_8)
        level_7 = try values.decodeIfPresent(Bool.self, forKey: .level_7)
        level_6 = try values.decodeIfPresent(Bool.self, forKey: .level_6)
        level_5 = try values.decodeIfPresent(Bool.self, forKey: .level_5)
        level_4 = try values.decodeIfPresent(Bool.self, forKey: .level_4)
        level_3 = try values.decodeIfPresent(Bool.self, forKey: .level_3)
        level_2 = try values.decodeIfPresent(Bool.self, forKey: .level_2)
        level_1 = try values.decodeIfPresent(Bool.self, forKey: .level_1)
        level_0 = try values.decodeIfPresent(Bool.self, forKey: .level_0)
        edit_others_pages = try values.decodeIfPresent(Bool.self, forKey: .edit_others_pages)
        edit_published_pages = try values.decodeIfPresent(Bool.self, forKey: .edit_published_pages)
        publish_pages = try values.decodeIfPresent(Bool.self, forKey: .publish_pages)
        delete_pages = try values.decodeIfPresent(Bool.self, forKey: .delete_pages)
        delete_others_pages = try values.decodeIfPresent(Bool.self, forKey: .delete_others_pages)
        delete_published_pages = try values.decodeIfPresent(Bool.self, forKey: .delete_published_pages)
        delete_posts = try values.decodeIfPresent(Bool.self, forKey: .delete_posts)
        delete_others_posts = try values.decodeIfPresent(Bool.self, forKey: .delete_others_posts)
        delete_published_posts = try values.decodeIfPresent(Bool.self, forKey: .delete_published_posts)
        delete_private_posts = try values.decodeIfPresent(Bool.self, forKey: .delete_private_posts)
        edit_private_posts = try values.decodeIfPresent(Bool.self, forKey: .edit_private_posts)
        read_private_posts = try values.decodeIfPresent(Bool.self, forKey: .read_private_posts)
        delete_private_pages = try values.decodeIfPresent(Bool.self, forKey: .delete_private_pages)
        edit_private_pages = try values.decodeIfPresent(Bool.self, forKey: .edit_private_pages)
        read_private_pages = try values.decodeIfPresent(Bool.self, forKey: .read_private_pages)
        delete_users = try values.decodeIfPresent(Bool.self, forKey: .delete_users)
        create_users = try values.decodeIfPresent(Bool.self, forKey: .create_users)
        unfiltered_upload = try values.decodeIfPresent(Bool.self, forKey: .unfiltered_upload)
        edit_dashboard = try values.decodeIfPresent(Bool.self, forKey: .edit_dashboard)
        update_plugins = try values.decodeIfPresent(Bool.self, forKey: .update_plugins)
        delete_plugins = try values.decodeIfPresent(Bool.self, forKey: .delete_plugins)
        install_plugins = try values.decodeIfPresent(Bool.self, forKey: .install_plugins)
        update_themes = try values.decodeIfPresent(Bool.self, forKey: .update_themes)
        install_themes = try values.decodeIfPresent(Bool.self, forKey: .install_themes)
        update_core = try values.decodeIfPresent(Bool.self, forKey: .update_core)
        list_users = try values.decodeIfPresent(Bool.self, forKey: .list_users)
        remove_users = try values.decodeIfPresent(Bool.self, forKey: .remove_users)
        promote_users = try values.decodeIfPresent(Bool.self, forKey: .promote_users)
        edit_theme_options = try values.decodeIfPresent(Bool.self, forKey: .edit_theme_options)
        delete_themes = try values.decodeIfPresent(Bool.self, forKey: .delete_themes)
        export = try values.decodeIfPresent(Bool.self, forKey: .export)
        copy_posts = try values.decodeIfPresent(Bool.self, forKey: .copy_posts)
        wpseo_bulk_edit = try values.decodeIfPresent(Bool.self, forKey: .wpseo_bulk_edit)
        enable_cometchat = try values.decodeIfPresent(Bool.self, forKey: .enable_cometchat)
        run_adminer = try values.decodeIfPresent(Bool.self, forKey: .run_adminer)
        manage_woocommerce = try values.decodeIfPresent(Bool.self, forKey: .manage_woocommerce)
        view_woocommerce_reports = try values.decodeIfPresent(Bool.self, forKey: .view_woocommerce_reports)
        edit_product = try values.decodeIfPresent(Bool.self, forKey: .edit_product)
        read_product = try values.decodeIfPresent(Bool.self, forKey: .read_product)
        delete_product = try values.decodeIfPresent(Bool.self, forKey: .delete_product)
        edit_products = try values.decodeIfPresent(Bool.self, forKey: .edit_products)
        edit_others_products = try values.decodeIfPresent(Bool.self, forKey: .edit_others_products)
        publish_products = try values.decodeIfPresent(Bool.self, forKey: .publish_products)
        read_private_products = try values.decodeIfPresent(Bool.self, forKey: .read_private_products)
        delete_products = try values.decodeIfPresent(Bool.self, forKey: .delete_products)
        delete_private_products = try values.decodeIfPresent(Bool.self, forKey: .delete_private_products)
        delete_published_products = try values.decodeIfPresent(Bool.self, forKey: .delete_published_products)
        delete_others_products = try values.decodeIfPresent(Bool.self, forKey: .delete_others_products)
        edit_private_products = try values.decodeIfPresent(Bool.self, forKey: .edit_private_products)
        edit_published_products = try values.decodeIfPresent(Bool.self, forKey: .edit_published_products)
        manage_product_terms = try values.decodeIfPresent(Bool.self, forKey: .manage_product_terms)
        edit_product_terms = try values.decodeIfPresent(Bool.self, forKey: .edit_product_terms)
        delete_product_terms = try values.decodeIfPresent(Bool.self, forKey: .delete_product_terms)
        assign_product_terms = try values.decodeIfPresent(Bool.self, forKey: .assign_product_terms)
        edit_shop_order = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_order)
        read_shop_order = try values.decodeIfPresent(Bool.self, forKey: .read_shop_order)
        delete_shop_order = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_order)
        edit_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_orders)
        edit_others_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .edit_others_shop_orders)
        publish_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .publish_shop_orders)
        read_private_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .read_private_shop_orders)
        delete_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_orders)
        delete_private_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .delete_private_shop_orders)
        delete_published_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .delete_published_shop_orders)
        delete_others_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .delete_others_shop_orders)
        edit_private_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .edit_private_shop_orders)
        edit_published_shop_orders = try values.decodeIfPresent(Bool.self, forKey: .edit_published_shop_orders)
        manage_shop_order_terms = try values.decodeIfPresent(Bool.self, forKey: .manage_shop_order_terms)
        edit_shop_order_terms = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_order_terms)
        delete_shop_order_terms = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_order_terms)
        assign_shop_order_terms = try values.decodeIfPresent(Bool.self, forKey: .assign_shop_order_terms)
        edit_shop_coupon = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_coupon)
        read_shop_coupon = try values.decodeIfPresent(Bool.self, forKey: .read_shop_coupon)
        delete_shop_coupon = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_coupon)
        edit_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_coupons)
        edit_others_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .edit_others_shop_coupons)
        publish_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .publish_shop_coupons)
        read_private_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .read_private_shop_coupons)
        delete_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_coupons)
        delete_private_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .delete_private_shop_coupons)
        delete_published_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .delete_published_shop_coupons)
        delete_others_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .delete_others_shop_coupons)
        edit_private_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .edit_private_shop_coupons)
        edit_published_shop_coupons = try values.decodeIfPresent(Bool.self, forKey: .edit_published_shop_coupons)
        manage_shop_coupon_terms = try values.decodeIfPresent(Bool.self, forKey: .manage_shop_coupon_terms)
        edit_shop_coupon_terms = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_coupon_terms)
        delete_shop_coupon_terms = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_coupon_terms)
        assign_shop_coupon_terms = try values.decodeIfPresent(Bool.self, forKey: .assign_shop_coupon_terms)
        edit_shop_webhook = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_webhook)
        read_shop_webhook = try values.decodeIfPresent(Bool.self, forKey: .read_shop_webhook)
        delete_shop_webhook = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_webhook)
        edit_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_webhooks)
        edit_others_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .edit_others_shop_webhooks)
        publish_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .publish_shop_webhooks)
        read_private_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .read_private_shop_webhooks)
        delete_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_webhooks)
        delete_private_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .delete_private_shop_webhooks)
        delete_published_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .delete_published_shop_webhooks)
        delete_others_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .delete_others_shop_webhooks)
        edit_private_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .edit_private_shop_webhooks)
        edit_published_shop_webhooks = try values.decodeIfPresent(Bool.self, forKey: .edit_published_shop_webhooks)
        manage_shop_webhook_terms = try values.decodeIfPresent(Bool.self, forKey: .manage_shop_webhook_terms)
        edit_shop_webhook_terms = try values.decodeIfPresent(Bool.self, forKey: .edit_shop_webhook_terms)
        delete_shop_webhook_terms = try values.decodeIfPresent(Bool.self, forKey: .delete_shop_webhook_terms)
        assign_shop_webhook_terms = try values.decodeIfPresent(Bool.self, forKey: .assign_shop_webhook_terms)
        wpseo_manage_options = try values.decodeIfPresent(Bool.self, forKey: .wpseo_manage_options)
        administrator = try values.decodeIfPresent(Bool.self, forKey: .administrator)
    }
    
}

public struct ExtraCapabilities : Codable {
    let administrator : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case administrator = "administrator"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        administrator = try values.decodeIfPresent(Bool.self, forKey: .administrator)
    }
    
}

