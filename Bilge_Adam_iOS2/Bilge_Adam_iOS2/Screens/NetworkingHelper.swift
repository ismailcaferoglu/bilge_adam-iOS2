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
    
    public func getDataFromRemote<T:Codable>(url:String,method:HTTPMethod, params: Parameters,encoding:ParameterEncoding = URLEncoding.default, callback:@escaping (Result<T,Error>)->Void){
        
        
        AF.request(url, method: method, parameters: params, encoding: encoding).validate().responseJSON(completionHandler: { response in
            
           
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
    
    //MARK: -- NonGeneric
    public func getDataFromRemote1(url:String,method:HTTPMethod, params: Parameters,encoding:ParameterEncoding = URLEncoding.default, callback:@escaping (Result<[Person],Error>)->Void){
        
        
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
