//
//  Router.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 20.10.2023.
//

import Foundation
import Alamofire

enum Router {
    
    case register(params:Parameters)
    case user
    case deleteUser(userId:String)
    
    var baseURL:String {
        return "https://65312bc24d4c2e3f333c8a9c.mockapi.io"
    }
    
    var path:String {
        switch self {
        case .register:
            return "/register"
        case .user:
            return "/user"
        case .deleteUser(let userId):
            return "/user/\(userId)"
        }
    }
    
    
    var method:HTTPMethod {
        switch self {
        case .register:
            return .post
        case .user:
            return .get
        case .deleteUser:
            return .delete
        }
    }
    
    
    var headers:HTTPHeaders {
        switch self {
        case .register, .user, .deleteUser:
            return [:]
        }
    }
    
    var parameters:Parameters? {
        switch self {
        case .register(let params):
            return params
        case .user, .deleteUser:
            return nil
        }
    }
    
    
}

extension Router:URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = headers
        
        let encoding:ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
    
}
