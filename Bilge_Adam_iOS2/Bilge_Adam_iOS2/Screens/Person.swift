//
//  Person.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 18.10.2023.
//

import Foundation

struct Person:Codable {
    
    var userName:String
    var userSurname:String
    var id:String
    
    enum CodingKeys:String,CodingKey {
        case userName = "name"
        case userSurname = "surname"
        case id
    }
}


struct Register:Codable {
    var email:String
    var password:String
    var id:String
}
