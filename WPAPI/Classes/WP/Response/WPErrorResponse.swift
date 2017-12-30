//
//  APIErrorResponse.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// Top level response for every failed request to the WordPress API
/// Everything in the API seems to be optional, so we cannot rely on having values here
public struct WPErrorResponse: Decodable {
    /// Whether it was ok or not
    public let code: String?
    /// Message that usually gives more information about some error
    public let message: String?
    /// Requested data
    public let data: WPErrorStatusContainer
}

/// All failed responses return this, and contains all
/// the metainformation about the returned chunk.
public struct WPErrorStatusContainer: Decodable {
    public let status: Int
    
    public init(status: Int = 0) {
        self.status = status
    }
}
