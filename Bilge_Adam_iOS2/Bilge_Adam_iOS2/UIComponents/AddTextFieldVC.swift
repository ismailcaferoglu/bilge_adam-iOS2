//
//  AddTextFieldVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 9.10.2023.
//

import UIKit
import SnapKit
import TinyConstraints

struct UserInfo {
    var name:String?
    var userName:String?
    var password:String?
}

class AddTextFieldVC: UIViewController {
    
    weak var delegate:DataTransferDelegate?
    var message:String! = "Ali"
    
    private lazy var txtUsername:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Kullanıcı adınızı giriniz"
        tf.delegate = self
        tf.keyboardType = .emailAddress
        tf.fontStyle = .avenirMedium(size: 40)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    private lazy var txtPassword:BilgeAdamTextField = {
        let tf = BilgeAdamTextField()
        tf.placeholder = "Soyad giriniz"
        
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
    

    
    @objc func backButtonTapped(){
        var user = UserInfo()
        user.name = txtUsername.text
        user.password = txtPassword.text
        delegate?.getDataFromSignUp(params: user)
        

        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightButtonTapped(){
        let vc = AddLabelVC()
        vc.modalPresentationStyle = .popover
        
        self.present(vc, animated: true)
        
    }
    

    private func setupViews(){
        
        let leftButtonImage = UIImage(systemName: "arrow.backward")
        let leftBarButton = UIBarButtonItem(image: leftButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButton.tintColor = .black
        
        let rightButtonImage = UIImage(systemName: "plus.app")
        
        let rightBarButton = UIBarButtonItem(image: rightButtonImage, style: .plain, target: self, action: #selector(rightButtonTapped))
       
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        
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
