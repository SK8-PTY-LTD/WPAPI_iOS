//
//  APIRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// All requests must conform to this protocol
/// - Discussion: You must conform to Encodable too, so that all stored public parameters
///   of types conforming this protocol will be encoded as parameters.
public protocol WPRequest: Encodable {
    /// Response (will be wrapped with a DataContainer)
    associatedtype Response: Decodable
    
    // Method
    var method: WPMethod { get }
    
    /// Endpoint for this request (the last part of the URL)
    var pathName: String { get }
    
    // Body
    var body: Data? { get }
}

public enum WPMethod: String, Codable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

