/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

open class Comment : Codable, WPAPI {
    
    // Slug for end point
    open class var endpoint: String {
        return "comments"
    }
    
	public let id : Int?
	public let comment : Int?
	public let parent : Int?
	public let author : Int?
	public let authorName : String?
	public let authorUrl : String?
	public let date : Date?
	public let dateGmt : Date?
	public let content : String?
	public let link : String?
	public let status : String?
	public let type : String?
	public let authorAvatarUrls : AvatarUrls?
	public let meta : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case comment = "comment"
		case parent = "parent"
		case author = "author"
		case author_name = "author_name"
		case author_url = "author_url"
		case date = "date"
		case date_gmt = "date_gmt"
		case content = "content"
		case link = "link"
		case status = "status"
		case type = "type"
		case author_avatar_urls = "author_avatar_urls"
		case meta = "meta"
	}

	required public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		comment = try values.decodeIfPresent(Int.self, forKey: .comment)
		parent = try values.decodeIfPresent(Int.self, forKey: .parent)
		author = try values.decodeIfPresent(Int.self, forKey: .author)
		authorName = try values.decodeIfPresent(String.self, forKey: .author_name)
		authorUrl = try values.decodeIfPresent(String.self, forKey: .author_url)
        date = WP.dateFormatter.date(from: (try values.decodeIfPresent(String.self, forKey: .date))!)
        dateGmt = WP.dateFormatter.date(from: (try values.decodeIfPresent(String.self, forKey: .date_gmt))!)
		content = (try values.decodeIfPresent(WPAPIText.self, forKey: .content))?.rendered
		link = try values.decodeIfPresent(String.self, forKey: .link)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		authorAvatarUrls = try AvatarUrls(from: decoder)
		meta = try values.decodeIfPresent([String].self, forKey: .meta)
	}
    
    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(comment, forKey: .comment)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(author, forKey: .author)
        try container.encodeIfPresent(authorName, forKey: .author_name)
        try container.encodeIfPresent(authorUrl, forKey: .author_url)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(dateGmt, forKey: .date_gmt)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(authorAvatarUrls, forKey: .author_avatar_urls)
        try container.encodeIfPresent(meta, forKey: .meta)
    }
    
    /// <#Description#>
    ///
    /// - Author: Jack
    /// - seeAlso
    ///   [List Comments](https://developer.wordpress.org/rest-api/reference/comments/#list-comments)
    /// - Parameters:
    ///   - context: Scope under which the request is made; determines fields present in response.
    ///   - page: Current page of the collection.
    ///   - perPage: Maximum number of items to be returned in result set.
    ///   - search: Limit results to those matching a string.
    ///   - after: Limit response to comments published after a given ISO8601 compliant date.
    ///   - author: Limit result set to comments assigned to specific authors.
    ///   - authorExclude: Ensure result set excludes comments assigned to specific authors.
    ///   - before: Limit response to comments published before a given ISO8601 compliant date.
    ///   - exclude: Ensure result set excludes specific IDs.
    ///   - include: Limit result set to specific IDs.
    ///   - offset: Offset the result set by a specific number of items.
    ///   - order: Order sort attribute ascending or descending.
    ///   - orderby: Sort collection by object attribute.
    ///   - slug: Limit result set to comments with one or more specific slugs.
    ///   - status: Limit result set to comments assigned one or more statuses.
    ///   - categories: Limit result set to all items that have the specified term assigned in the categories taxonomy.
    ///   - categoriesExclude:     Limit result set to all items except those that have the specified term assigned in the categories taxonomy.
    ///   - completion: Completion handle
    public static func list<T>(context: Context? = nil,
                               page: Int? = nil,
                               perPage: Int? = nil,
                               search: String? = nil,
                               after: Date? = nil,
                               author: [Int]? = nil,
                               authorExclude: [Int]? = nil,
                               authroEmail: String? = nil,
                               before: Date? = nil,
                               exclude: [Int]? = nil,
                               include: [Int]? = nil,
                               offset: Int? = nil,
                               order: Order? = nil,
                               orderby: OrderBy? = nil,
                               parent: [Int]?,
                               parentExclude: [Int]?,
                               post: [Int]?,
                               status: String?,
                               type: String?,
                               password: String?,
                               completion: @escaping ResultCallback<[T]>) where T : WPAPI {
        
        let request = ListComments<T>(context: context,
                                   page: page,
                                   perPage: perPage,
                                   search: search,
                                   after: after,
                                   author: author,
                                   authorExclude: authorExclude,
                                   authorEmail: authroEmail,
                                   before: before,
                                   exclude: exclude,
                                   include: include,
                                   offset: offset,
                                   order: order,
                                   orderby: orderby,
                                   parent: parent,
                                   parentExclude: parentExclude,
                                   post: post,
                                   status: status,
                                   type: type,
                                   password: password)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let comments):
                completion(.success(comments))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    public func save<T>(completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if self.id != nil {
            
            // ID exists, Update A Comment
            let request = UpdateAComment<T>(comment: self)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let comment):
                    completion(.success(comment))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            
            // ID does not exist, Create A Comment
            let request = CreateAComment<T>(comment: self as! T)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let comment):
                    completion(.success(comment))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    public static func get<T>(id: Int, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        let request = RetrieveAComment<T>(id: id)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let comment):
                completion(.success(comment))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func delete<T>(force: Bool? = false, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if let id = self.id {
            let request = DeleteAComment<T>(id: id, force: force)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let comment):
                    completion(.success(comment))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(WPError.client(message: "Current comment object is not saved on server yet, therefore cannot be deleted", code: .MISSING_OBJECT_ID)))
        }
        
    }

}
