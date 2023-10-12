//
//  AddButtonVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 11.10.2023.
//

import UIKit
import TinyConstraints

class AddButtonVC: UIViewController {
    
    private lazy var btnHello:UIButton = {
        let b = UIButton()
        b.setTitle("Say Hello", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .systemBlue
       
        //MARK: -- Add Button action
        b.addTarget(self, action: #selector(btnHelloTapped), for: .touchUpInside)
        
        b.layer.cornerRadius = 8
        b.centerTextAndImage(spacing: 8)
        b.setImage(UIImage(systemName: "key.fill"), for: .normal)
        b.tintColor = .white
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    @objc func btnHelloTapped(){
        
        let vc = AddTextFieldVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setupViews(){
        self.view.addSubviews(btnHello)
        setupLayout()
    }
 

    private func setupLayout(){
        btnHello.horizontalToSuperview(insets:.left(24) + .right(24))
        btnHello.height(52)
        btnHello.bottomToSuperview(offset:-24,usingSafeArea: true)
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct AddButtonVC_Preview: PreviewProvider {
    static var previews: some View{
         
        AddButtonVC().showPreview()
    }
}
#endif
