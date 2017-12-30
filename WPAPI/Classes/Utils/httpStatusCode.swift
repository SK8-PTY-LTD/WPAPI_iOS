//
//  WPHttpStatusCode.swift
//  BL
//
//  Created by SongXujie on 26/12/17.
//  Copyright © 2017 SK8 PTY LTD. All rights reserved.
//

/// Common HTTP status code listed as enum
/// - Author: Jack
/// - seeAlso
/// [Consume RESTful APIs using Alamofire with Swift 3](https://hhtopcu.github.io/articles/consume-restful-api-using-alamofire/)
/// [How To Troubleshoot Common HTTP Error Codes](https://www.digitalocean.com/community/tutorials/how-to-troubleshoot-common-http-error-codes)
public enum httpStatusCode : Int {
    case OK = 200                       // /GET, /DELETE result is successful
    case BAD_REQUEST = 400              // Possibly the parameters are invalid
    case INVALID_CREDENTIAL = 401       // INVALID CREDENTIAL, possible invalid token
    case FORBIDDEN = 403                // INVALID CREDENTIAL, possible invalid token
    case NOT_FOUND = 404                // The item you looked for is not found
    case INTERAL_SERVER_ERROR = 500     // The server cannot process the request for an unknown reason.
    case BAD_GATEWAY = 502              // The server is a gateway or proxy server, and it is not receiving a valid response from the backend servers that should actually fulfill the request.
    case SERVICE_UNAVAILABLE = 503      // The server is overloaded or under maintenance.
    case GATEWAY_TIMEOUT = 504          // The server is a gateway or proxy server, and it is not receiving a response from the backend servers within the allowed time period.
}
