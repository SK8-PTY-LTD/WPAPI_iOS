//
//  WPRestEndpoint.swift
//  BL
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

//import Alamofire
//
//enum Endpoint {
//    
//    case GetPosts()
//    case GetPost(postId: String)
//    case UpdatePost(post: Post)
//    
//    // MARK: - Public Properties
//    var method: HTTPMethod {
//        switch self {
//        case .GetPosts:
//            return .get
//        case .GetPost:
//            return .get
//        case .UpdatePost:
//            return .post
//        }
//    }
//    
//    var url: URL {
//        
//        let httpProtocol = "https"
//        let domainName = "beanlinked.com"
//        let nameSpace = "/wp-json"
//        let baseUrlString = httpProtocol + "://" + domainName + nameSpace
//        let baseUrl = NSURL(string: baseUrlString)
//        
//        switch self {
//        case .GetPosts():
//            return (baseUrl?.appendingPathComponent("/wp/v2/posts"))!
//        case .GetPost(let postId):
//            return (baseUrl?.appendingPathComponent("/wp/v2/posts\(postId)"))!
//        case .UpdatePost(let post):
//            return (baseUrl?.appendingPathComponent("/wp/v2/posts\(post.id!)"))!
//        }
//    }
//}
//
///// [API Client in Swift](http://kean.github.io/post/api-client#endpoint)
//final class WPEndpoint<Response> {
//    let method: Method
//    let path: Path
//    let parameters: Parameters?
//    let decode: (Data) throws -> Response
//    
//    init(method: Method = .get,
//         path: Path,
//         parameters: Parameters? = nil,
//         decode: @escaping (Data) throws -> Response) {
//        self.method = method
//        self.path = path
//        self.parameters = parameters
//        self.decode = decode
//    }
//}
//
//typealias Parameters = [String: Any]
//typealias Path = String
//
//enum Method {
//    case get, post, put, patch, delete
//}

