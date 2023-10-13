//
//  ViewController.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 3.10.2023.
//

import UIKit

protocol DataTransferDelegate:AnyObject {
    func getData(data:String)
    func getDataFromSignUp(params:UserInfo)
    
}

extension DataTransferDelegate {
    func getData(data:String){ }
    func getDataFromSignUp(params:UserInfo){ }
}

class TurkiyeVC: UIViewController,DataTransferDelegate {
    
    var lozanMetni:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    
        let vc = LozanVC()
        vc.ismetPasha = self
        //vc.fromTurkiye = "HomeVC'den geliyorum"

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getData(data: String) {
        print(data)
    }
  

}

 


 
