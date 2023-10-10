//
//  DetailVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 3.10.2023.
//

import UIKit

class LozanVC: UIViewController {
    
    var data:String!
    
    weak var delegate:
    
    private lazy var btnBack:UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Geri Dön", for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = .green
        print(data)
        self.view.addSubview(btnBack)
    }
    
    @objc func btnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    

     
}
