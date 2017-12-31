/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

open class Media : Codable, WPAPI {
    
    // Slug for end point
    open class var endpoint: String {
        return "media"
    }
    
	public let id : Int?
    public let date : Date?
    public let dateGmt : Date?
    public let modified : Date?
    public let modifiedGmt : Date?
	public let slug : String?
	public let status : String?
	public let type : String?
	public let link : String?
	public let title : String?
	public let author : Int?
	public let commentStatus : String?
	public let pingStatus : String?
	public let template : String?
	public let meta : [String]?
	public let description : String?
	public let caption : String?
	public let altText : String?
	public let mediaType : String?
	public let mimeType : String?
	public let mediaDetails : MediaDetails?
	public let post : Int?
	public let sourceUrl : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case date = "date"
		case date_gmt = "date_gmt"
		case modified = "modified"
		case modified_gmt = "modified_gmt"
		case slug = "slug"
		case status = "status"
		case type = "type"
		case link = "link"
		case title = "title"
		case author = "author"
		case comment_status = "comment_status"
		case ping_status = "ping_status"
		case template = "template"
		case meta = "meta"
        case description = "description"
		case caption = "caption"
		case alt_text = "alt_text"
		case media_type = "media_type"
		case mime_type = "mime_type"
		case media_details = "media_details"
		case post = "post"
		case source_url = "source_url"
	}

	required public init(from decoder: Decoder) throws {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		id = try values.decodeIfPresent(Int.self, forKey: .id)
        date = formatter.date(from: try values.decodeIfPresent(String.self, forKey: .date)!)
        dateGmt = formatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_gmt)!)
        modified = formatter.date(from: try values.decodeIfPresent(String.self, forKey: .modified)!)
        modifiedGmt = formatter.date(from: try values.decodeIfPresent(String.self, forKey: .modified_gmt)!)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		link = try values.decodeIfPresent(String.self, forKey: .link)
        title = try (try values.decodeIfPresent(WPAPIText.self, forKey: .title))?.rendered
		author = try values.decodeIfPresent(Int.self, forKey: .author)
		commentStatus = try values.decodeIfPresent(String.self, forKey: .comment_status)
		pingStatus = try values.decodeIfPresent(String.self, forKey: .ping_status)
		template = try values.decodeIfPresent(String.self, forKey: .template)
		meta = try values.decodeIfPresent([String].self, forKey: .meta)
		description = (try values.decodeIfPresent(WPAPIText.self, forKey: .description))?.rendered
		caption = (try values.decodeIfPresent(WPAPIText.self, forKey: .caption))?.rendered
		altText = try values.decodeIfPresent(String.self, forKey: .alt_text)
		mediaType = try values.decodeIfPresent(String.self, forKey: .media_type)
		mimeType = try values.decodeIfPresent(String.self, forKey: .mime_type)
		mediaDetails = try values.decodeIfPresent(MediaDetails.self, forKey: .media_details)
		post = try values.decodeIfPresent(Int.self, forKey: .post)
		sourceUrl = try values.decodeIfPresent(String.self, forKey: .source_url)
	}
    
    public func encode(to encoder: Encoder) throws {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(dateGmt, forKey: .date_gmt)
        try container.encodeIfPresent(modified, forKey: .modified)
        try container.encodeIfPresent(modifiedGmt, forKey: .modified_gmt)
        try container.encodeIfPresent(slug, forKey: .slug)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(author, forKey: .author)
        try container.encodeIfPresent(commentStatus, forKey: .comment_status)
        try container.encodeIfPresent(pingStatus, forKey: .ping_status)
        try container.encodeIfPresent(template, forKey: .template)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(caption, forKey: .caption)
        try container.encodeIfPresent(altText, forKey: .alt_text)
        try container.encodeIfPresent(mediaType, forKey: .media_type)
        try container.encodeIfPresent(mediaDetails, forKey: .media_details)
        try container.encodeIfPresent(post, forKey: .post)
        try container.encodeIfPresent(sourceUrl, forKey: .source_url)
        
    }

}

public struct MediaDetails : Codable {
    let width : Int?
    let height : Int?
    let file : String?
    let sizes : Sizes?
    let imageMeta : ImageMeta?
    
    enum CodingKeys: String, CodingKey {
        
        case width = "width"
        case height = "height"
        case file = "file"
        case sizes = "sizes"
        case image_meta = "image_meta"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        file = try values.decodeIfPresent(String.self, forKey: .file)
        sizes = try values.decodeIfPresent(Sizes.self, forKey: .sizes)
        imageMeta = try values.decodeIfPresent(ImageMeta.self, forKey: .image_meta)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(file, forKey: .file)
        try container.encodeIfPresent(sizes, forKey: .sizes)
        try container.encodeIfPresent(imageMeta, forKey: .image_meta)
        
    }
    
}

public struct Sizes : Codable {
    let thumbnail : MediaSize?
    let medium : MediaSize?
    let full : MediaSize?
    
    enum CodingKeys: String, CodingKey {
        
        case thumbnail = "thumbnail"
        case medium = "medium"
        case full = "full"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        thumbnail = try values.decodeIfPresent(MediaSize.self, forKey: .thumbnail)
        medium = try values.decodeIfPresent(MediaSize.self, forKey: .medium)
        full = try values.decodeIfPresent(MediaSize.self, forKey: .full)
    }
    
}

public struct ImageMeta : Codable {
	let aperture : Int?
	let credit : String?
	let camera : String?
	let caption : String?
	let createdTimestamp : Int?
	let copyright : String?
	let focalLength : Int?
	let iso : Int?
	let shutterSpeed : Int?
	let title : String?
	let orientation : Int?
	let keywords : [String]?

	enum CodingKeys: String, CodingKey {

		case aperture = "aperture"
		case credit = "credit"
		case camera = "camera"
		case caption = "caption"
		case created_timestamp = "created_timestamp"
		case copyright = "copyright"
		case focal_length = "focal_length"
		case iso = "iso"
		case shutter_speed = "shutter_speed"
		case title = "title"
		case orientation = "orientation"
		case keywords = "keywords"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		aperture = try values.decodeIfPresent(Int.self, forKey: .aperture)
		credit = try values.decodeIfPresent(String.self, forKey: .credit)
		camera = try values.decodeIfPresent(String.self, forKey: .camera)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
		createdTimestamp = try values.decodeIfPresent(Int.self, forKey: .created_timestamp)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		focalLength = try values.decodeIfPresent(Int.self, forKey: .focal_length)
		iso = try values.decodeIfPresent(Int.self, forKey: .iso)
		shutterSpeed = try values.decodeIfPresent(Int.self, forKey: .shutter_speed)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		orientation = try values.decodeIfPresent(Int.self, forKey: .orientation)
		keywords = try values.decodeIfPresent([String].self, forKey: .keywords)
	}
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(aperture, forKey: .aperture)
        try container.encodeIfPresent(credit, forKey: .credit)
        try container.encodeIfPresent(camera, forKey: .camera)
        try container.encodeIfPresent(caption, forKey: .caption)
        try container.encodeIfPresent(createdTimestamp, forKey: .created_timestamp)
        try container.encodeIfPresent(copyright, forKey: .copyright)
        try container.encodeIfPresent(focalLength, forKey: .focal_length)
        try container.encodeIfPresent(iso, forKey: .iso)
        try container.encodeIfPresent(shutterSpeed, forKey: .shutter_speed)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(orientation, forKey: .orientation)
        try container.encodeIfPresent(keywords, forKey: .keywords)
        
    }

}

public struct MediaSize : Codable {
	let file : String?
	let width : Int?
	let height : Int?
	let mimeType : String?
	let sourceUrl : String?

	enum CodingKeys: String, CodingKey {

		case file = "file"
		case width = "width"
		case height = "height"
		case mime_type = "mime_type"
		case source_url = "source_url"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		file = try values.decodeIfPresent(String.self, forKey: .file)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		mimeType = try values.decodeIfPresent(String.self, forKey: .mime_type)
		sourceUrl = try values.decodeIfPresent(String.self, forKey: .source_url)
	}
    
    public func encode(to encoder: Encoder) throws {
     
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(file, forKey: .file)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(mimeType, forKey: .mime_type)
        try container.encodeIfPresent(sourceUrl, forKey: .source_url)
        
    }

}