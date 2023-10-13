//
//  AddButtonVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 11.10.2023.
//

import UIKit
import TinyConstraints

class AddButtonVC: UIViewController {
    
    var userData:UserInfo?
    
    private lazy var txtUsername:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
       
        tf.keyboardType = .emailAddress
        tf.isSecureTextEntry = true
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    private lazy var txtPassword:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Şifre giriniz"
        tf.isSecureTextEntry = true
        tf.keyboardType = .numberPad
       
        return tf
    }()
    
    private lazy var btnHello:UIButton = {
        let b = UIButton()
        b.setTitle("Say Hello", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .systemBlue
       
        //MARK: -- Add Button action
        b.addTarget(self, action: #selector(btnHelloTapped), for: .touchUpInside)
        b.contentHorizontalAlignment = .left
        b.layer.cornerRadius = 8
        b.centerTextAndImage(spacing: 8)
        b.setImage(UIImage(systemName: "key.fill"), for: .normal)
        b.tintColor = .white
        return b
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
        
        let vc = AddTextFieldVC()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func btnHelloTapped(){
        
        print(self.userData?.name)
    }
    
    
    func setupViews(){
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        stackView.addArrangedSubviews(txtUsername,txtPassword)
        self.view.addSubviews(stackView, btnHello)
        setupLayout()
    }
 

    private func setupLayout(){
        
        txtUsername.snp.makeConstraints({ $0.height.equalTo(50) })
        
        stackView.snp.makeConstraints({ stack in
            stack.leading.equalToSuperview().offset(24)
            stack.trailing.equalToSuperview().offset(-24)
            stack.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
        })
        
        btnHello.horizontalToSuperview(insets:.left(24) + .right(24))
        btnHello.height(52)
        btnHello.bottomToSuperview(offset:-24,usingSafeArea: true)
    }
}

extension AddButtonVC:DataTransferDelegate {
    
    func getDataFromSignUp(params: UserInfo) {
        self.userData = params
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
