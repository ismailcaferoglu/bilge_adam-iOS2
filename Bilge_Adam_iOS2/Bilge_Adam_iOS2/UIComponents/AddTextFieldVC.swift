//
//  AddTextFieldVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 9.10.2023.
//

import UIKit
import SnapKit

class AddTextFieldVC: UIViewController {
    
    private lazy var txtUsername:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
        tf.delegate = self
        tf.keyboardType = .emailAddress
        tf.isSecureTextEntry = true
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    private lazy var txtPassword:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Soyad giriniz"
        tf.isSecureTextEntry = true
        tf.keyboardType = .numberPad
        tf.delegate = self
        return tf
    }()
    
    private lazy var txtPasswordConfirm:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Şifre giriniz."
       
        tf.sideView = .left(image: UIImage(systemName: "key.horizontal"))
    
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

        let text = txtUsername.text
        print(text)
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

extension AddTextFieldVC:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(textField.text)
        print(textField.text?.count)
        
        if textField == txtUsername && textField.text?.count == 30 {
            return false
        }else if textField == txtPassword && textField.text?.count == 10{
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .green
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .red
    }
}



#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct AddTextfieldVC_Preview: PreviewProvider {
    static var previews: some View{
         
        AddTextFieldVC().showPreview()
    }
}
#endif
