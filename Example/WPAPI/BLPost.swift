//
//  BLAd.swift
//  Beanlinked
//
//  Created by SongXujie on 2/1/18.
//  Copyright © 2018 SK8Tech. All rights reserved.
//

/*
 Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 */

import WPAPI

class BLPost : Post {
    
    let betterAuthor : User?
    let betterFeaturedImage : Media?
    
    private enum CodingKeys: String, CodingKey {
        
        case better_author = "better_author"
        case better_featured_image = "better_featured_image"
        
    }
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        betterAuthor = try values.decodeIfPresent(User.self, forKey: .better_author)
        betterFeaturedImage = try values.decodeIfPresent(Media.self, forKey: .better_featured_image)
//        betterAuthor = nil
//        betterFeaturedImage = nil
        // Get superDecoder for superclass and call super.init(from:) with it
        //        let superDecoder = try values.superDecoder() // superDecoder is not working, see https://stackoverflow.com/questions/44553934/using-decodable-in-swift-4-with-inheritance#_=_ && https://stackoverflow.com/questions/47518209/decoder-containerkeyedby-throws-decodingerror-typemismatch-error-codable-bug?rq=1
        try super.init(from: decoder)
    }
    
    override init(title: String?, content: String?, featuredMedia: Int?, categories: [Int]?) {
        betterAuthor = nil
        betterFeaturedImage = nil
        super.init(title: title, content: content, featuredMedia: featuredMedia, categories: categories)
    }
    
    override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // Neither of betterAuthor && betterFeaturedImage should be encoded
        
        // Get superEncoder for superclass and call super.encode(to:) with it
        //        let superEncoder = container.superEncoder() // Not using super encoder, as this will encode parent properties into a 'super' property, which does not work with WordPress.
        try super.encode(to: encoder)
    }
    
}

