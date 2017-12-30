/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
class Ad : Post {
    
    // Slug for end point
    override class var endpoint: String {
        return "ads"
    }
    
	var expiryDate : Date?
	let vendor : Int
	var currency : String?
	var unit : String?
	var imageArray : [String]?
	var totalPriceInCent : Int
    var productUrl : String?

    public init(title: String?,
                content: String?,
                featured_media: Int?,
                categories: [Int]? = [],
                expiryDate : Date? = Date(timeIntervalSince1970: 1),
                vendor : Int,
                productUrl : String? = "https://beanlinked.com",
                currency : String? = "",
                unit : String? = "",
                imageArray : [String]? = [""],
                totalPriceInCent : Int = 0) {
        self.expiryDate  = expiryDate
        self.vendor  = vendor
        self.currency  = currency
        self.unit  = unit
        self.imageArray  = imageArray
        self.totalPriceInCent  = totalPriceInCent
        self.productUrl  = productUrl
        
        super.init(title: title, content: content, featuredMedia: featured_media, categories: categories)
    }

	enum CodingKeys: String, CodingKey {

		case expiry_date = "expiry_date"
		case vendor = "vendor"
		case currency = "currency"
		case unit = "unit"
		case image_array = "image_array"
		case total_price_in_cent = "total_price_in_cent"
		case product_url = "product_url"
        case fields = "fields"
        
	}
    
    // Fields is necessary. When creating an ad, ACF needs to be send in "fields" key. Hence all ACF needs to go into Fields
    enum Fields: String, CodingKey {
        
        case expiry_date = "expiry_date"
        case vendor = "vendor"
        case currency = "currency"
        case unit = "unit"
        case image_array = "image_array"
        case total_price_in_cent = "total_price_in_cent"
        case product_url = "product_url"
    }

    required init(from decoder: Decoder) throws {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        
        // Get our container for this subclass' coding keys
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
		expiryDate = formatter.date(from: try values.decodeIfPresent(String.self, forKey: .expiry_date)!)
        vendor = Int((try values.decodeIfPresent(String.self, forKey: .vendor))!)!
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		unit = try values.decodeIfPresent(String.self, forKey: .unit)
        imageArray = try values.decodeIfPresent([String].self, forKey: .image_array)
        totalPriceInCent = Int((try values.decodeIfPresent(String.self, forKey: .total_price_in_cent))!)!
        productUrl = try values.decodeIfPresent(String.self, forKey: .product_url)
        
        // Get superDecoder for superclass and call super.init(from:) with it
//        let superDecoder = try values.superDecoder() // superDecoder is not working, see https://stackoverflow.com/questions/44553934/using-decodable-in-swift-4-with-inheritance#_=_ && https://stackoverflow.com/questions/47518209/decoder-containerkeyedby-throws-decodingerror-typemismatch-error-codable-bug?rq=1
        try super.init(from: decoder)
	}
    
    override func encode(to encoder: Encoder) throws {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        var fields = container.nestedContainer(keyedBy: Fields.self, forKey: .fields)
        
        try fields.encodeIfPresent(formatter.string(from: expiryDate ?? Date()), forKey: .expiry_date)
        try fields.encodeIfPresent(vendor, forKey: .vendor)
        try fields.encodeIfPresent(currency, forKey: .currency)
        try fields.encodeIfPresent(unit, forKey: .unit)
        try fields.encodeIfPresent(imageArray, forKey: .image_array)
        try fields.encodeIfPresent(totalPriceInCent, forKey: .total_price_in_cent)
        try fields.encodeIfPresent(productUrl, forKey: .product_url)
        
        // Get superEncoder for superclass and call super.encode(to:) with it
//        let superEncoder = container.superEncoder() // Not using super encoder, as this will encode parent properties into a 'super' property, which does not work with WordPress.
        try super.encode(to: encoder)
    }

}
