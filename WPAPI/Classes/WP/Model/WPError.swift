//
//  APIError.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
public enum WPError: Error {
    case encoding
    case decoding
    case server(message: String)
    case client(message: String)
}
