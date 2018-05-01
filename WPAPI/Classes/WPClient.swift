//
//  WPAPIClient.swift
//  WPAPI
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

import Foundation

public protocol WPAPI: Codable {
    
    /// Endpoint for this request (the last part of the URL)
    static var endpoint: String { get }
    
}

public enum Context: String, Codable {
    case view = "view"
    case embed = "embed"
    case edit = "edit"
}

public enum Order: String, Codable {
    case asc = "asc"
    case desc = "desc"
}

public enum OrderBy: String, Codable {
    case author = "author"
    case date = "date"
    case id = "id"
    case include = "include"
    case modified = "modified"
    case parent = "parent"
    case relevance = "relevance"
    case slug = "slug"
    case title = "title"
}

public enum Status: String, Codable {
    case draft = "draft"
    case publish = "publish"
}

// TODO Move WooCommerce related enum to the 'right' place
public enum WCStatus: String, Codable {
    case any = "any"
    case pending = "pending"
    case processing = "processing"
    case onHold = "on-hold"
    case completed = "completed"
    case cancelled = "cancelled"
    case refunded = "refunded"
    case failed = "failed"
}

public enum MediaType: String, Codable {
    case image = "image"
    case video = "video"
    case audio = "audio"
    case application = "application"
}

public struct WPAPIText : Codable {
    let raw: String?
    let rendered : String?
    let protected : Bool?
    
    //    enum CodingKeys: String, CodingKey {
    //
    //        case rendered = "rendered"
    //        case protected = "protected"
    //    }
    //
    //    init(from decoder: Decoder) throws {
    //        let values = try decoder.container(keyedBy: CodingKeys.self)
    //        rendered = try values.decodeIfPresent(String.self, forKey: .rendered)
    //        protected = try values.decodeIfPresent(Bool.self, forKey: .protected)
    //    }
    
}

public struct AvatarUrls : Codable {
    
    public let size24 : String?
    public let size48 : String?
    public let size96 : String?
    
    enum CodingKeys: String, CodingKey {
        
        case size24 = "24"
        case size48 = "48"
        case size96 = "96"
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        size24 = try values.decodeIfPresent(String.self, forKey: .size24)
        size48 = try values.decodeIfPresent(String.self, forKey: .size48)
        size96 = try values.decodeIfPresent(String.self, forKey: .size96)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(size24, forKey: .size24)
        try container.encodeIfPresent(size48, forKey: .size48)
        try container.encodeIfPresent(size96, forKey: .size96)
    }
    
}

public enum Role: String, Codable {
    case subscriber = "subscriber"
    case contributor = "contributor"
    case author = "author"
    case editor = "editor"
    case administrator = "administrator"
}


public class WP {
    
    public static var sharedInstance: WP!
    public static let dateFormatter = DateFormatter()
    public static private(set) var currentUser: User?

    public let baseURL: String!
    private let session = URLSession(configuration: .default)
    public private(set) var authorizationToken: String?
    
    
    public init(baseURL: String, authToken: String? = nil) {
        
        self.baseURL = baseURL
        self.authorizationToken = authToken
        
        WP.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        WP.sharedInstance = self
    }
    
    /// Sends a request to WordPress servers, calling the completion method when finished
    public func send<T: WPRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        
        // Determine end point
        let req = self.request(for: request)
        let task = session.dataTask(with: req) { data, response, error in
            if let data = data {
                do {
                    //                    print("Response data \(data.base64EncodedString())")
                    // Decode the top level response failed, decode as failure
                    // if it's a failure
                    let errorResponse = try JSONDecoder().decode(WPErrorResponse.self, from: data)
                    if let message = errorResponse.message {
                        completion(.failure(WPError.server(message: message, code: Int(errorResponse.code!))))
                    } else {
                        completion(.failure(WPError.decoding))
                    }
                } catch {
                    // Decode the top level response, and look up the decoded response to see
                    // if it's a success or a failure
                    do {
                        let apiResponse = try JSONDecoder().decode(T.Response.self, from: data)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// Sends a request to WordPress servers, calling the completion method when finished
    public func upload<T: WPRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        
        // Determine end point
        
        let endpoint = URL(string: "\(baseURL!)/wp-json\(request.pathName)")
        
        print(request.method.rawValue + ": " + endpoint!.absoluteString)
        
        // Create Request
        var req = URLRequest(url: endpoint!)
        
        req.httpMethod = request.method.rawValue
        
        // JWT Authorization
        if let authToken = self.authorizationToken {
            req.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        // Set additional header for Content-Type.
        let boundary = "Boundary-\(UUID().uuidString)"
        req.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        // Set body data
        req.httpBody = createBody(boundary: boundary,
                                  data: request.body!,
                                  mimeType: "image/png",
                                  filename: "\(WP.dateFormatter.string(from: Date())).png")
        
        let task = session.dataTask(with: req) { data, response, error in
            if let data = data {
                do {
                    // print("Response data \(data.base64EncodedString())")
                    // Decode the top level response failed, decode as failure
                    // if it's a failure
                    let errorResponse = try JSONDecoder().decode(WPErrorResponse.self, from: data)
                    if let message = errorResponse.message {
                        completion(.failure(WPError.server(message: message, code: Int(errorResponse.code!))))
                    } else {
                        completion(.failure(WPError.decoding))
                    }
                } catch {
                    // Decode the top level response, and look up the decoded response to see
                    // if it's a success or a failure
                    do {
                        let apiResponse = try JSONDecoder().decode(T.Response.self, from: data)
                        completion(.success(apiResponse))
                    } catch {
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    /// <#Description#>
    ///
    /// - seeAlso:
    /// (Swift upload multi form upload)[https://github.com/newfivefour/BlogPosts/blob/master/swift-form-data-multipart-upload-URLRequest.md]
    /// - Parameters:
    ///   - boundary: <#boundary description#>
    ///   - data: <#data description#>
    ///   - mimeType: <#mimeType description#>
    ///   - filename: <#filename description#>
    /// - Returns: <#return value description#>
    func createBody(boundary: String,
                    data: Data,
                    mimeType: String,
                    filename: String) -> Data {
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
//        for (key, value) in parameters {
//            body.appendString(boundaryPrefix)
//            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
//            body.appendString("\(value)\r\n")
//        }
        
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }
    
    /// Encodes a URL based on the given request
    /// Everything needed for a public request to WordPress servers is encoded directly in this URL
    private func request<T: WPRequest>(for request: T) -> URLRequest {
    
    // This timestamp and hash are needed for WordPress requests
//    let timestamp = Date().timeIntervalSince1970
//    let hash = "\(timestamp)\(privateKey)\(publicKey)".md5
    
    // Construct the final URL with all the previous data
//        return URL(string: "\(baseEndpoint)\(request.resourceName)?ts=\(timestamp)&hash=\(hash)&apikey=\(publicKey)&\(parameters)")!
        
        // Determine end point
        var endpoint: URL?
        switch request.method {
        case .get:
            guard let parameters = try? URLQueryEncoder.encode(request) else { fatalError("Wrong parameters") }
            endpoint = URL(string: "\(baseURL!)/wp-json\(request.pathName)?\(parameters)")
        default:
            endpoint = URL(string: "\(baseURL!)/wp-json\(request.pathName)")
        }
        
        print(request.method.rawValue + ": " + endpoint!.absoluteString)
        
        // Create Request
        var req = URLRequest(url: endpoint!)
        
        req.httpMethod = request.method.rawValue
        
        // JWT Authorization
        if let authToken = self.authorizationToken {
            req.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        // Set additional header for Content-Type.
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Set body data
        if let body = request.body {
            req.httpBody = body
        }
        
        return req
    }
    
    public func updateAuthToken(authToken : String, completion: @escaping ResultCallback<User>) {
        print("WPAPI: authToken updated \(authToken)")
        self.authorizationToken = authToken
        
        User.getMe { (response: Result<User>) in
            
            switch response {
            case .success(let me):
                WP.currentUser = me
                print("WPAPI: currentUser updated: \(WP.currentUser!.username!)")
                completion(.success(me))
            case .failure(let error):
                self.authorizationToken = nil
                WP.currentUser = nil
                completion(.failure(error))
                print("WPAPI: authToken error: \(error)")
            }
        }
    }
    
    public static func logOut() {
        if let currentUser = WP.currentUser {
            print("WPAPI: \(currentUser.username!) logged out")
        } else {
            print("WPAPI: No currentUser logged in. User already logged out")
        }
        WP.sharedInstance.authorizationToken = nil
        WP.currentUser = nil
    }
}
