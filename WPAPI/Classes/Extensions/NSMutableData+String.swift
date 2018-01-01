//
//  NSMutableData+String.swift
//  WPAPI
//
//  Created by SongXujie on 1/1/18.
//  Copyright © 2018 SK8Tech. All rights reserved.
//

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
