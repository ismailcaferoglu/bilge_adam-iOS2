//
//  AddButtonVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 11.10.2023.
//

import UIKit
import TinyConstraints

class AddButtonVC: UIViewController,DataTransferDelegate {
    
    var userData:UserInfo?
    
    private lazy var txtUsername:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
       
        tf.keyboardType = .emailAddress
         
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    private lazy var txtPassword:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Şifre giriniz"
        
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
        b.contentHorizontalAlignment = .center
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
        
        let vc = AddTextFieldVC() //1
        //vc.delegate = self
        vc.message = "Ahmet"
        let vc1 = AddTextFieldVC()
        vc1.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //MARK: -- Protocol Method
    func getDataFromSignUp(params: UserInfo) {
        txtUsername.text = params.name
        txtPassword.text = params.password
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
    
    func sumNumbers(number:Int){
        let sumNum = number * number
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



#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct AddButtonVC_Preview: PreviewProvider {
    static var previews: some View{
         
        AddButtonVC().showPreview()
    }
}
#endif
