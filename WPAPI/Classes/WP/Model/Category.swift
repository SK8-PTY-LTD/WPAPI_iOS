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

}
