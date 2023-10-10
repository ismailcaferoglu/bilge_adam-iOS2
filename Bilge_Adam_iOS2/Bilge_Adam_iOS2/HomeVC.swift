//
//  ViewController.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 3.10.2023.
//

import UIKit

protocol DataTransferDelegate:AnyObject {
    func getData(data:String)
    
}

extension DataTransferDelegate {
    func getData(data:String){ }
}

class TurkiyeVC: UIViewController,DataTransferDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    
        
        let vc = LozanVC()
        vc.data = "HomeVC'den geliyorum"

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getData(data: String) {
        print("DetailVC'den gelen data: \(data)")
    }
    
     

}

 


 
