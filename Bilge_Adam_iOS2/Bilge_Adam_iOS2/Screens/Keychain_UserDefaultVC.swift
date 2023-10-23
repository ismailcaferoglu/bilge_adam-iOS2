//
//  KeychainVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 18.10.2023.
//

import UIKit
import TinyConstraints

class Keychain_UserDefaultVC: UIViewController {
    
    var testArray:[Person]?
    
    
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
        
        //fetchData()
        
        print(self.testArray)
        setupViews()
//        let url = "https://652f7dac0b8d8ddac0b28ec7.mockapi.io/users/1"
//        let params = ["name":txtUsername.text ?? ""]
//        
//        NetworkingHelper.shared.getDataFromRemote(url: url, method: .get, params: params, callback: { (result:Result<Person,Error>) in
//            
//            switch result {
//            case .success(let obj):
//                print(obj)
//                //self.testArray = obj
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//            
//        })
        
        
        
        
//        NetworkingHelper.shared.getDataFromRemote(url: urlPost, method: .post, params: paramsPost, callback: { (result:Result<Register,Error>) in
//            
//            switch result {
//            case .success(let obj):
//                print(obj)
//                //self.testArray = obj
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//            
//        })
       
    }
    
    @objc func btnSaveTapped(){
        
        
        print("Network işlemi bitti.")
//        saveToUserDefault(data: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmdWxsX25hbWUiOiJkb2d1Y2FuZHVyZ3VuIiwiaWQiOiI3MmZhOTJjOS1mZDc5LTRiNTgtOTkwZC1mMmViYmI2NzVmMWUiLCJyb2xlIjoiQURBTSIsImV4cCI6MTY5MzkwNjAzNH0.XiE_0eftICE-LDJ96vaGsH_RAr7205ja0Ow0tSLkHio")
        
        //MARK: -- Data tipine dönüştürülmüş değerleri Keychain'e service ve account bilgilerine göre yazar.
//        let data = Data(txtUsername.text!.utf8)
//        KeychainHelper.shared.save(data, service: "api-key", account: "meta")
    }
    
//    func fetchData(){
//        let url = "https://652f7dac0b8d8ddac0b28ec7.mockapi.io/users/1"
//        print("İşlem tetiklendi.")
//        
//        let params = ["name":txtUsername.text ?? ""]
//        NetworkingHelper.shared.getDataFromRemote(url: url, method: .get, params: params, callback: { (result:Result<[Person],Error>) in
//            
//            print("Sonuç VC'de alındı.")
//            switch result {
//            case .success(let obj):
//                self.testArray = obj
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        })
//        
//        
//    }
    
    @objc func btnReadTapped(){
        
        readFromUserDefault()
       
        //MARK: -- Keychain üzerindeki tüm accountlara ait bilgileri getirir.
        //print(KeychainHelper.shared.getAllKeyChainItemsOfClass(kSecClassGenericPassword as String))
        
        //MARK: -- Keychain üzerindeki service ve account'a göre veri getirme işlemi yapar.
//        guard let data = KeychainHelper.shared.read(service: "access-token", account: "google") else {
//            print("Data bulunamadı")
//            return
//        }
//        
//        
//        let string = String(data: data, encoding: .utf8)
//        print(string)
    }
    
    @objc func btnDeleteTapped(){
        
        deleteFromUserDefaults()
        //MARK: -- Keychain üzerindeki service ve account'a göre silme işlemi yapar.
        //KeychainHelper.shared.delete("api-key", account: "meta")
    }
    
    
    //MARK: -- User Default ile ilgili tüm işlemler.
    
    private func saveToUserDefault(data:String){
        UserDefaults.standard.setValue(data, forKey: "access-token")
    }
    
    private func readFromUserDefault(){
        let object = UserDefaults.standard.string(forKey: "access-token")
        print(object)
    }
    
    private func deleteFromUserDefaults(){
        UserDefaults.standard.removeObject(forKey: "access-token")
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
