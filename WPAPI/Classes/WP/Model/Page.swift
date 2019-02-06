/*
 Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation

open class Page : Codable, WPAPI {
    
    // Slug for end point
    open class var endpoint: String {
        return "pages"
    }
    
    public let id : Int?
    public let date : Date?
    public let dateGmt : Date?
    public let modified : Date?
    public let modifiedGmt : Date?
    public var slug : String?
    public var status : String?
    public let type : String?
    public var link : String?
    public var password: String?
    public var title : String?
    public var content : String?
    public var excerpt : String?
    public let author : Int?
    public var featuredMedia : Int?
    public let commentStatus : String?
    public let pingStatus : String?
    public let parent : Int?
    public let menuOrder : Int?
//    public let meta : [String]?
//    public let template : String?
    
    public init(title : String?, content : String?, featuredMedia : Int?, parent : Int?) {
        
        self.id  = nil
        self.date  = nil
        self.dateGmt  = nil
        self.modified  = nil
        self.modifiedGmt  = nil
        self.slug  = nil
        self.status  = nil
        self.type  = nil
        self.link  = nil
        self.password = nil
        self.title  = title
        self.content  = content
        self.excerpt  = nil
        self.author = WP.currentUser?.id
        self.featuredMedia  = featuredMedia
        self.commentStatus  = nil
        self.pingStatus  = nil
        self.parent  = parent
        self.menuOrder = nil
//        self.meta  = nil
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case date = "date"
        case date_gmt = "date_gmt"
        case modified = "modified"
        case modified_gmt = "modified_gmt"
        case slug = "slug"
        case status = "status"
        case type = "type"
        case password = "password"
        case link = "link"
        case title = "title"
        case content = "content"
        case excerpt = "excerpt"
        case author = "author"
        case featured_media = "featured_media"
        case comment_status = "comment_status"
        case ping_status = "ping_status"
        case parent = "parent"
        case menu_order = "menu_order"
//        case meta = "meta"
    }
    
    required public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        date = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date)!)
        dateGmt = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_gmt)!)
        modified = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .modified)!)
        modifiedGmt = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .modified_gmt)!)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        title = (try values.decodeIfPresent(WPAPIText.self, forKey: .title))?.rendered
        content = (try values.decodeIfPresent(WPAPIText.self, forKey: .content))?.rendered
        excerpt = (try values.decodeIfPresent(WPAPIText.self, forKey: .excerpt))?.rendered
        author = try values.decodeIfPresent(Int.self, forKey: .author)
        featuredMedia = try values.decodeIfPresent(Int.self, forKey: .featured_media)
        commentStatus = try values.decodeIfPresent(String.self, forKey: .comment_status)
        pingStatus = try values.decodeIfPresent(String.self, forKey: .ping_status)
        parent = try values.decodeIfPresent(Int.self, forKey: .parent)
        menuOrder = try values.decodeIfPresent(Int.self, forKey: .menu_order)
//        meta = try values.decodeIfPresent([String].self, forKey: .meta)
    }
    
    open func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(WP.dateFormatter.string(from: date ?? Date()), forKey: .date)
        try container.encodeIfPresent(WP.dateFormatter.string(from: dateGmt ?? Date()), forKey: .date_gmt)
        try container.encodeIfPresent(WP.dateFormatter.string(from: modified ?? Date()), forKey: .modified)
        try container.encodeIfPresent(WP.dateFormatter.string(from: modifiedGmt ?? Date()), forKey: .modified_gmt)
        try container.encodeIfPresent(slug, forKey: .slug)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(password, forKey: .password)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(excerpt, forKey: .excerpt)
        try container.encodeIfPresent(author, forKey: .author)
        try container.encodeIfPresent(featuredMedia, forKey: .featured_media)
        try container.encodeIfPresent(commentStatus, forKey: .comment_status)
        try container.encodeIfPresent(pingStatus, forKey: .ping_status)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(menuOrder, forKey: .menu_order)
//        try container.encodeIfPresent(meta, forKey: .meta)
    }
    
    /// <#Description#>
    ///
    /// - Author: Jack
    /// - seeAlso
    ///   [List Pages](https://developer.wordpress.org/rest-api/reference/pages/#list-pages)
    /// - Parameters:
    ///   - context: Scope under which the request is made; determines fields present in response.
    ///   - page: Current page of the collection.
    ///   - perPage: Maximum number of items to be returned in result set.
    ///   - search: Limit results to those matching a string.
    ///   - after: Limit response to pages published after a given ISO8601 compliant date.
    ///   - author: Limit result set to pages assigned to specific authors.
    ///   - authorExclude: Ensure result set excludes pages assigned to specific authors.
    ///   - before: Limit response to pages published before a given ISO8601 compliant date.
    ///   - exclude: Ensure result set excludes specific IDs.
    ///   - include: Limit result set to specific IDs.
    ///   - offset: Offset the result set by a specific number of items.
    ///   - order: Order sort attribute ascending or descending.
    ///   - orderby: Sort collection by object attribute.
    ///   - slug: Limit result set to pages with one or more specific slugs.
    ///   - status: Limit result set to pages assigned one or more statuses.
    ///   - categories: Limit result set to all items that have the specified term assigned in the categories taxonomy.
    ///   - categoriesExclude:     Limit result set to all items except those that have the specified term assigned in the categories taxonomy.
    ///   - completion: Completion handle
    public static func list<T>(context: Context? = nil,
                               page: Int? = nil,
                               perPage: Int? = nil,
                               search: String? = nil,
                               after: Date? = nil,
                               author: Int? = nil,
                               authorExclude: [Int]? = nil,
                               before: Date? = nil,
                               exclude: [Int]? = nil,
                               include: [Int]? = nil,
                               menuOrder: Int? = nil,
                               offset: Int? = nil,
                               order: Order? = nil,
                               orderby: OrderBy? = nil,
                               parent: [Int]? = nil,
                               parentExclude: [Int]? = nil,
                               slug: String? = nil,
                               status: Status? = nil,
                               filters: [String: AnyObject]? = nil,
                               completion: @escaping ResultCallback<[T]>) where T : WPAPI {
        
        let request = ListPages<T>(context: context,
                                   page: page,
                                   perPage: perPage,
                                   search: search,
                                   after: after,
                                   author: author,
                                   authorExclude: authorExclude,
                                   before: before,
                                   exclude: exclude,
                                   include: include,
                                   menuOrder: menuOrder,
                                   offset: offset,
                                   order: order,
                                   orderby: orderby,
                                   parent: parent,
                                   parentExclude: parentExclude,
                                   slug: slug,
                                   status: status,
                                   filters: filters)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let pages):
                completion(.success(pages))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    public func save<T>(completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if self.id != nil {
            
            // ID exists, Update A Page
            let request = UpdateAPage<T>(page: self)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let page):
                    completion(.success(page))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            
            // ID does not exist, Create A Page
            let request = CreateAPage<T>(page: self as! T)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let page):
                    completion(.success(page))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    public static func get<T>(id: Int, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        let request = RetrieveAPage<T>(id: id)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let page):
                completion(.success(page))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func delete<T>(force: Bool? = false, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if let id = self.id {
            let request = DeleteAPage<T>(id: id, force: force)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let page):
                    completion(.success(page))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(WPError.client(message: "Current page object is not saved on server yet, therefore cannot be deleted", code: .MISSING_OBJECT_ID)))
        }
        
    }
    
}

