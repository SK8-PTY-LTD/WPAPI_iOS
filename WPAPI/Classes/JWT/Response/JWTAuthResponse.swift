//
//  APIResponse.swift
//  WPSDK
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// Top level response for every request to the WordPress API
/// Everything in the API seems to be optional, so we cannot rely on having values here
public struct JWTAuthResponse<Response: Decodable>: Decodable {
    public let token: String
    public let user_email: String
    public let user_nicename: String
    public let user_display_name: String
}
