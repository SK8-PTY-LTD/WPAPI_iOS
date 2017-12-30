//
//  APIRequest.swift
//  WPSDK
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
