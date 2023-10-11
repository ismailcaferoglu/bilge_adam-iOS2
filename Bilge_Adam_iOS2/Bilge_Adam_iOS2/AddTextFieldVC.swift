//
//  AddTextFieldVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 9.10.2023.
//

import UIKit
import SnapKit

class AddTextFieldVC: UIViewController {
    
    private lazy var txtUsername:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
        tf.font = UIFont(name: "Avenir-Medium", size: 14)
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 16
        return tf
    }()
    
    private lazy var txtPassword:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
        tf.font = UIFont(name: "Avenir-Medium", size: 14)
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 16
        return tf
    }()
    
    private lazy var txtPasswordConfirm:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
        tf.font = UIFont(name: "Avenir-Medium", size: 14)
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 16
        return tf
    }()
    
    private lazy var stackView:UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    

    private func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubviews(stackView)
        
        stackView.addArrangedSubviews(txtUsername,txtPassword,txtPasswordConfirm)
        
        setupLayout()
    }
    
    
    private func setupLayout(){
        
        txtUsername.snp.makeConstraints({ $0.height.equalTo(50) })
        
        stackView.snp.makeConstraints({ stack in
            stack.leading.equalToSuperview().offset(24)
            stack.trailing.equalToSuperview().offset(-24)
            stack.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
        })
        
    }
   

}





#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomeVC_Preview: PreviewProvider {
    static var previews: some View{
         
        HomeVC().showPreview()
    }
}
#endif
