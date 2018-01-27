//
//  APIRequest.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// Encodes any encodable to a URL query string
public enum URLQueryEncoder {
	static func encode<T: Encodable>(_ encodable: T) throws -> String {
		let parametersData = try JSONEncoder().encode(encodable)
		let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
		return parameters
			.map({ "\($0)=\($1)" })
			.joined(separator: "&")
			.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
	}
}

// Utility type so that we can decode any type of HTTP parameter
// Useful when we have mixed types in a HTTP request
public enum HTTPParameter: CustomStringConvertible, Decodable {
    case string(String)
    case bool(Bool)
    case int(Int)
    case double(Double)
    case intArray([Int])
    case stringArray([String])
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else if let double = try? container.decode(Double.self) {
            self = .double(double)
        } else if let intArray = try? container.decode([Int].self) {
            self = .intArray(intArray)
        } else if let stringArray = try? container.decode([String].self) {
            self = .stringArray(stringArray)
        } else {
            throw WPError.decoding
        }
    }
    
    public var description: String {
        switch self {
        case .string(let string):
            return string
        case .bool(let bool):
            return String(describing: bool)
        case .int(let int):
            return String(describing: int)
        case .double(let double):
            return String(describing: double)
        case .intArray(let intArray):
            let arrayValue = (intArray.map{String($0)}).joined(separator: ",")
            return arrayValue
        case .stringArray(let stringArray):
            let arrayValue = (stringArray.map{String($0)}).joined(separator: ",")
            return arrayValue
        }
    }
}
