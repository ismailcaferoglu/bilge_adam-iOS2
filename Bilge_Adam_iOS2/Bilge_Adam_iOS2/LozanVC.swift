//
//  DetailVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 3.10.2023.
//

import UIKit

class LozanVC: UIViewController {
    
    var fromTurkiye:String!
    
    weak var ismetPasha:DataTransferDelegate?
    
    private lazy var btnBack:UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Geri Dön", for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = .green
        
        self.view.addSubview(btnBack)
    }
    
    @objc func btnTapped(){
        
        ismetPasha?.getData(data: fromTurkiye)
        ismetPasha?.hatay(isConfirm: false)
        ismetPasha?.azinliklar(isConfirm: true)
        self.navigationController?.popViewController(animated: true)
    }
    

     
}
