/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

open class Category : Codable, WPAPI {
    
    // Slug for end point
    open class var endpoint: String {
        return "categories"
    }
    
    public let id : Int?
    public let count : Int?
    public var description : String?
    public var link : String?
    public var name : String?
    public var slug : String?
    public var parent : Int?
    public var meta : [String]?
    
    public init(name : String?, description : String?, parent : Int?) {
        
        self.id  = nil
        self.count = nil
        self.description = description
        self.link = nil
        self.name = name
        self.slug = nil
        self.parent = parent
        self.meta = nil
    }

	private enum CodingKeys: String, CodingKey {

		case id = "id"
		case count = "count"
		case description = "description"
		case link = "link"
		case name = "name"
		case slug = "slug"
		case parent = "parent"
		case meta = "meta"
	}

	required public init(from decoder: Decoder) throws {
		
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		parent = try values.decodeIfPresent(Int.self, forKey: .parent)
		meta = try values.decodeIfPresent([String].self, forKey: .meta)
	}
    
    open func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(slug, forKey: .slug)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(meta, forKey: .meta)
    }
    
    public static func list<T>(context: Context? = nil,
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
                               slug: String? = nil,
                               completion: @escaping ResultCallback<[T]>) where T : WPAPI {
        
        let request = ListCategories<T>(context: context,
                                        page: page,
                                        perPage: perPage,
                                        search: search,
                                        exclude: exclude,
                                        include: include,
                                        order: order,
                                        orderby: orderby,
                                        hideEmpty: hideEmpty,
                                        parent: parent,
                                        post: post,
                                        slug: slug)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let categories):
                completion(.success(categories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    public func save<T>(completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if self.id != nil {
            
            // ID exists, Update A Category
            let request = UpdateACategory<T>(category: self)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let category):
                    completion(.success(category))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            
            // ID does not exist, Create A Category
            let request = CreateACategory<T>(category: self as! T)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let category):
                    completion(.success(category))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    public static func get<T>(id: Int, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        let request = RetrieveACategory<T>(id: id)
        
        WP.sharedInstance.send(request) { response in
            
            switch response {
            case .success(let category):
                completion(.success(category))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func delete<T>(force: Bool? = false, completion: @escaping ResultCallback<T>) where T: WPAPI {
        
        if let id = self.id {
            let request = DeleteACategory<T>(id: id, force: force)
            
            WP.sharedInstance.send(request) { response in
                
                switch response {
                case .success(let category):
                    completion(.success(category))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(WPError.client(message: "Current category object is not saved on server yet, therefore cannot be deleted", code: .MISSING_OBJECT_ID)))
        }
        
    }

}
