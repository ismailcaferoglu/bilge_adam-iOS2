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
    
    typealias Callback<T:Codable> = (Result<T,Error>)->Void
    
    public func getDataFromRemote<T:Codable>(urlRequest:Router, callback:@escaping Callback<T>) {
        
        
//        AF.request(urlRequest).validate().responseDecodable(of:T.self) { response in
//            
//            switch response.result {
//            case .success(let success):
//                callback(.success(success))
//            case .failure(let failure):
//
//                print(failure)
//            }
//        }
        
                AF.request(urlRequest).validate().responseJSON(completionHandler: { response in
        
        
                    switch response.result {
                    case .success(let object):
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: object)
                            let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
        
                            callback(.success(decodedData))
                        } catch {
                            callback(.failure(error))
                        }
        
        
        
                    case .failure(let err):
                        callback(.failure(err))
                    }
        
                    
                })
        

        
    }
    
    
    public func getDataFromRemoteWithoutRouter<T:Codable>(url:String,method:HTTPMethod, params: Parameters,encoding:ParameterEncoding = URLEncoding.default, callback:@escaping (Result<T,Error>)->Void) {
        
        
        //MARK: -- responseJSON() ile data parse işlemi JSONSerialization aracılığıyla yapılır.
        //        AF.request(url, method: method, parameters: params, encoding: encoding).validate().responseJSON(completionHandler: { response in
        //
        //
        //        }
        //
        //            switch response.result {
        //            case .success(let object):
        //                do {
        //                    let jsonData = try JSONSerialization.data(withJSONObject: object)
        //                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
        //
        //                    callback(.success(decodedData))
        //                } catch {
        //                    callback(.failure(error))
        //                }
        //
        //
        //
        //            case .failure(let err):
        //                callback(.failure(err))
        //            }
        //        })
                
                //MARK: -- responseDecodable(of:_) ile data parse işlemi Alamofire tarafından yapılır.
                AF.request(url,method: method, parameters: params, encoding: encoding).validate().responseDecodable(of: T.self){ response in
        
                    switch response.result {
                    case .success(let success):
                        callback(.success(success))
                    case .failure(let failure):
        
                        print(failure)
                    }
        
                }
                
    }
    
    
    //MARK: -- NonGeneric
    public func getDataFromRemoteWithoutGeneric(url:String,method:HTTPMethod, params: Parameters,encoding:ParameterEncoding = URLEncoding.default, callback:@escaping (Result<[Person],Error>)->Void){
        
        
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
