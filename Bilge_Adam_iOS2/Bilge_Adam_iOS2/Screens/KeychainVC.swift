//
//  KeychainVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 18.10.2023.
//

import UIKit
import TinyConstraints

class KeychainVC: UIViewController {
    
    
    private lazy var txtUsername:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
        tf.keyboardType = .emailAddress
        tf.fontStyle = .avenirMedium(size: 14)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    private lazy var btnSave:UIButton = {
        let b = UIButton()
        b.setTitle("Kaydet", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .systemBlue
        b.addTarget(self, action: #selector(btnSaveTapped), for: .touchUpInside)
        b.tintColor = .white
        return b
    }()
    
    private lazy var btnRead:UIButton = {
        let b = UIButton()
        b.setTitle("Oku", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .systemBlue
        b.addTarget(self, action: #selector(btnReadTapped), for: .touchUpInside)
        b.tintColor = .white
        return b
    }()
    
    private lazy var btnDelete:UIButton = {
        let b = UIButton()
        b.setTitle("Sil", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .systemBlue
        b.addTarget(self, action: #selector(btnDeleteTapped), for: .touchUpInside)
        b.tintColor = .white
        return b
    }()
    
    private lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 12
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
       
    }
    
    @objc func btnSaveTapped(){
        let data = Data(txtUsername.text!.utf8)
        KeychainHelper.shared.save(data, service: "api-key", account: "meta")
    }
    
    @objc func btnReadTapped(){
       
        print(KeychainHelper.shared.getAllKeyChainItemsOfClass(kSecClassGenericPassword as String))
        guard let data = KeychainHelper.shared.read(service: "access-token", account: "google") else {
            print("Data bulunamadı")
            return
        }
        
        
        let string = String(data: data, encoding: .utf8)
        print(string)
    }
    
    @objc func btnDeleteTapped(){
        KeychainHelper.shared.delete("api-key", account: "meta")
    }
    
    private func setupViews(){
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.view.addSubviews(stackView)
        stackView.addArrangedSubviews(txtUsername,
                                      btnSave,
                                      btnRead,
                                      btnDelete)
        setupLayout()
    }
    
    private func setupLayout() {
        stackView.edgesToSuperview(excluding: .bottom, insets: .left(12) + .right(12), usingSafeArea: true)
        stackView.height(240)
    }
    
}
