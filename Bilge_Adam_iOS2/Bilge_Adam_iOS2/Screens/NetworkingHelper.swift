//
//  NetworkingHelper.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 18.10.2023.
//

import Foundation
import Alamofire


class NetworkingHelper {
    
    static let shared = NetworkingHelper()
    
    public func getDataFromRemote(url:String,method:HTTPMethod, params: Parameters,encoding:ParameterEncoding = URLEncoding.default, callback:@escaping (Result<[Person],Error>)->Void){
        
        
        AF.request(url, method: method, parameters: params, encoding: encoding).validate().responseJSON(completionHandler: { response in
            
           
            switch response.result {
            case .success(let object):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: object)
                    let decodedData = try JSONDecoder().decode([Person].self, from: jsonData)
                    
                    callback(.success(decodedData))
                } catch {
                    callback(.failure(error))
                }
                
                
                
            case .failure(let err):
                callback(.failure(err))
            }
        })
        
        
    }
}








//func auth(fromApi:String, params:Parameters, callback: @escaping (Result<Any,Error>) -> Void){
//        
//        AF.request(fromApi,
//                   method:.post, parameters: params,
//                   encoding: JSONEncoding.default).validate()
//        .responseJSON{ response in
//            
//            switch response.result {
//            case .success(let value):
//                
//                print(value)
//                
//                callback(.success(value))
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: value)
//                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
//                    callback(.success(decodedData))
//                } catch {
//                    callback(.failure(error))
//                }
//            case .failure(let err):
//                callback(.failure(err))
//            }
//        }
//    }
