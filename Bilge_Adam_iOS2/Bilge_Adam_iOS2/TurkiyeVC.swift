//
//  ViewController.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 3.10.2023.
//

import UIKit

protocol DataTransferDelegate:AnyObject {
    func getData(data:String)
    func hatay(isConfirm:Bool)
    func azinliklar(isConfirm:Bool)
    
}

extension DataTransferDelegate {
    func getData(data:String){ }
}

class TurkiyeVC: UIViewController,DataTransferDelegate {
    
    var lozanMetni:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    
        let vc = LozanVC()
        //vc.ismetPasha = self
        vc.fromTurkiye = "HomeVC'den geliyorum"

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getData(data: String) {
        self.lozanMetni = data
        print("DetailVC'den gelen data: \(data)")
    }
    
    func hatay(isConfirm: Bool) {
        print(isConfirm)
    }
    
    func azinliklar(isConfirm: Bool) {
        print(isConfirm)
    }
     

}

 


 
