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
    case server(message: String, code: Int?)
    case client(message: String, code: SDKStatusCode)
    //
    
    /// Common HTTP status code listed as enum
    /// - Author: Jack
    /// - seeAlso
    /// [Consume RESTful APIs using Alamofire with Swift 3](https://hhtopcu.github.io/articles/consume-restful-api-using-alamofire/)
    /// [How To Troubleshoot Common HTTP Error Codes](https://www.digitalocean.com/community/tutorials/how-to-troubleshoot-common-http-error-codes)
    public enum HTTPStatusCode : Int {
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
    
    public enum SDKStatusCode: Int {
        
        case OTHER_CAUSE = -1;
        /**
         * Error code indicating that something has gone wrong with the server. If you get this error
         * code, it is AVOSCloud's fault. Contact us at https://parse.com/help
         */
        case INTERNAL_SERVER_ERROR = 1;
        /**
         * Error code indicating the connection to the AVOSCloud servers failed.
         */
        case CONNECTION_FAILED = 100;
        /**
         * Error code indicating the specified object doesn't exist.
         */
        case OBJECT_NOT_FOUND = 101;
        /**
         * Error code indicating you tried to query with a datatype that doesn't support it, like exact
         * matching an array or object.
         */
        case INVALID_QUERY = 102;
        /**
         * Error code indicating a missing or invalid classname. Classnames are case-sensitive. They must
         * start with a letter, and a-zA-Z0-9_ are the only valid characters.
         */
        case INVALID_CLASS_NAME = 103;
        /**
         * Error code indicating an unspecified object id.
         */
        case MISSING_OBJECT_ID = 104;
        /**
         * Error code indicating an invalid key name. Keys are case-sensitive. They must start with a
         * letter, and a-zA-Z0-9_ are the only valid characters.
         */
        case INVALID_KEY_NAME = 105;
        /**
         * Error code indicating a malformed pointer. You should not see this unless you have been mucking
         * about changing internal AVOSCloud code.
         */
        case INVALID_POINTER = 106;
        /**
         * Error code indicating that badly formed JSON was received upstream. This either indicates you
         * have done something unusual with modifying how things encode to JSON, or the network is failing
         * badly.
         */
        case INVALID_JSON = 107;
        /**
         * Error code indicating that the feature you tried to access is only available internally for
         * testing purposes.
         */
        case COMMAND_UNAVAILABLE = 108;
        /**
         * You must call AVOSCloud.initialize before using the AVOSCloud library.
         */
        case NOT_INITIALIZED = 109;
        /**
         * Error code indicating that a field was set to an inconsistent type.
         */
        case INCORRECT_TYPE = 111;
        /**
         * Error code indicating an invalid channel name. A channel name is either an empty string (the
         * broadcast channel) or contains only a-zA-Z0-9_ characters and starts with a letter.
         */
        case INVALID_CHANNEL_NAME = 112;
        /**
         * Error code indicating that push is misconfigured.
         */
        case PUSH_MISCONFIGURED = 115;
        /**
         * Error code indicating that the object is too large.
         */
        case OBJECT_TOO_LARGE = 116;
        /**
         * Error code indicating that the operation isn't allowed for clients.
         */
        case OPERATION_FORBIDDEN = 119;
        /**
         * Error code indicating the result was not found in the cache.
         */
        case CACHE_MISS = 120;
        /**
         * Error code indicating that an invalid key was used in a nested JSONObject.
         */
        case INVALID_NESTED_KEY = 121;
        /**
         * Error code indicating that an invalid filename was used for ALFile. A valid file name contains
         * only a-zA-Z0-9_. characters and is between 1 and 128 characters.
         */
        case INVALID_FILE_NAME = 122;
        /**
         * Error code indicating an invalid ACL was provided.
         */
        case INVALID_ACL = 123;
        /**
         * Error code indicating that the request timed out on the server. Typically this indicates that
         * the request is too expensive to run.
         */
        case TIMEOUT = 124;
        /**
         * Error code indicating that the email address was invalid.
         */
        case INVALID_EMAIL_ADDRESS = 125;
        /**
         * Error code indicating that the file address was invalid.
         */
        case INVALID_FILE_URL = 126;
        
        /**
         * 用来标识手机号码格式错误的错误代码
         */
        case INVALID_PHONE_NUMBER = 127;
        /**
         * Error code indicating that a unique field was given a value that is already taken.
         */
        case DUPLICATE_VALUE = 137;
        /**
         * Error code indicating that a role's name is invalid.
         */
        case INVALID_ROLE_NAME = 139;
        /**
         * Error code indicating that an application quota was exceeded. Upgrade to resolve.
         */
        case EXCEEDED_QUOTA = 140;
        /**
         * Error code indicating that a Cloud Code script failed.
         */
        case SCRIPT_ERROR = 141;
        /**
         * Error code indicating that cloud code validation failed.
         */
        case VALIDATION_ERROR = 142;
        /**
         * Error code indicating that deleting a file failed.
         */
        case FILE_DELETE_ERROR = 153;
        /**
         * Error code indicating that the username is missing or empty.
         */
        case USERNAME_MISSING = 200;
        /**
         * Error code indicating that the password is missing or empty.
         */
        case PASSWORD_MISSING = 201;
        /**
         * Error code indicating that the username has already been taken.
         */
        case USERNAME_TAKEN = 202;
        /**
         * Error code indicating that the email has already been taken.
         */
        case EMAIL_TAKEN = 203;
        /**
         * Error code indicating that the email is missing, but must be specified.
         */
        case EMAIL_MISSING = 204;
        /**
         * Error code indicating that an user with the specified email was not found.
         */
        case EMAIL_NOT_FOUND = 205;
        /**
         * Error code indicating that an user object without a valid session could not be altered.
         */
        case SESSION_MISSING = 206;
        /**
         * Error code indicating that an user can only be created through signup.
         */
        case MUST_CREATE_USER_THROUGH_SIGNUP = 207;
        /**
         * Error code indicating that an an account being linked is already linked to another user.
         */
        case ACCOUNT_ALREADY_LINKED = 208;
        /**
         * Error code indicating that User ID mismatch.
         */
        case USER_ID_MISMATCH = 209;
        /**
         * Error code indicating that username and password mismatched.
         */
        case USERNAME_PASSWORD_MISMATCH = 210;
        
        /**
         * Error code indicating that user doesn't exist
         */
        case USER_DOESNOT_EXIST = 211;
        
        /**
         * 　用户并没有绑定手机号码
         */
        case USER_MOBILEPHONE_MISSING = 212;
        
        /**
         * 　没有找到绑定了该手机号的用户
         */
        case USER_WITH_MOBILEPHONE_NOT_FOUND = 213;
        
        /**
         * 这个号码已经绑定过别的账号了
         */
        case USER_MOBILE_PHONENUMBER_TAKEN = 214;
        
        /**
         * 这个手机号码尚未被验证过
         */
        case USER_MOBILEPHONE_NOT_VERIFIED = 215;
        /**
         * Error code indicating that an user cannot be linked to an account because that account's id
         * could not be found.
         */
        case LINKED_ID_MISSING = 250;
        /**
         * Error code indicating that an user with a linked (e.g. Facebook) account has an invalid
         * session.
         */
        case INVALID_LINKED_SESSION = 251;
        /**
         * Error code indicating that a service being linked (e.g. Facebook or Twitter) is unsupported.
         */
        case UNSUPPORTED_SERVICE = 252;
        
        /**
         * Error code indicating the file checkSum value is not equals to original file
         */
        case FILE_DOWNLOAD_INCONSISTENT_FAILURE = 253;
        
        /**
         * Error code indicating client is rate limited by avoscloud server.
         */
        case RATE_LIMITED = 503;
        
        /**
         * Error code indicating unknown reason.
         */
        case UNKNOWN = 999;
    }
}
