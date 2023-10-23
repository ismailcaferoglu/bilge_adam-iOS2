//
//  TESTVC.swift
//  Bilge_Adam_Sample
//
//  Created by İsmail Caferoğlu on 13.08.2023.
//

import UIKit
import Alamofire



//MARK: -- Generic protocol. assosiatedType protocollere generic tipler tanımlamak için kullanılır.
protocol Fetchable {
    
    associatedtype T
    
    func getData(name:T)
    

}


//MARK: -- Generic Class with generic protocol
class APIHelper<T>:Fetchable {
   
    
    func getData(name:T) {
        guard let person = name as? Person else { return }
        print(person.userName)
    }
    
   
}


//MARK: -- Generic Class
class Movie<T> {
    
    init(name:T){
        
        print(name)
    }
    
    func test(name:T){
        
    }
    
}

protocol Prot {
    associatedtype T
    var test:T? { get }
    func customFunc(item:T)->T
}

class FetchHelper<T>:Prot {
    
    typealias Kind = T
    var test: T?
    
    func customFunc(item: T) -> T {
        return item
    }

}

class Helper<T>:Prot {
    typealias Item = T
    var test: T?
    func customFunc(item: T) -> T {
        
        print(item)
        return item
    }
}

class GenericsVC: UIViewController {
   
    let helper = APIHelper<Person>()
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let movie = Movie(name: "Deneme")
       
        let test = APIHelper<Int>()
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper.getData(name: Person(userName: "asdkjaşskdljalksdjalkd", userSurname: "", id: ""))
       
        
    }
    
}


 


struct Email:Codable {
    var id:String
    var UserId:String
    var email:String
}

struct Film:Codable {
    
    var filmName:String
    var filmId:String
    var rating:String
}
