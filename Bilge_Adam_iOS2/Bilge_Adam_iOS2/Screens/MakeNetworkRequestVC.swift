//
//  
//  MakeNetworkRequestVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 23.10.2023.
//
//
import UIKit
import TinyConstraints


#Preview {
    return MakeNetworkRequestVC()
}

class MakeNetworkRequestVC: UIViewController {
    
    //MARK: -- Properties
    
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

    
    //MARK: -- Views
    
    
    //MARK: -- Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupViews()
       
    }
    
    @objc func btnSaveTapped(){

        let paramsPost = ["email":txtUsername.text ?? "",
                      "password":"123123"]
        
        NetworkingHelper.shared.getDataFromRemote(urlRequest: .register(params: paramsPost), callback: { (result:Result<Register,Error>) in
            
            print(result)
        })
    }
    
    @objc func btnReadTapped(){
        
    }
    
    //MARK: -- Component Actions
    @objc func btnDeleteTapped(){
        guard let id = txtUsername.text else { return }
        
        NetworkingHelper.shared.getDataFromRemote(urlRequest: .deleteUser(userId: id), callback: { (result:Result<String,Error>) in
            print(result)
        })
        

    }
    
    //MARK: -- Private Methods
    
    
    //MARK: -- UI Methods
    func setupViews() {
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.view.addSubviews(stackView)
        stackView.addArrangedSubviews(txtUsername,
                                      btnSave,
                                      btnRead,
                                      btnDelete)
        setupLayout()
    }
    
    func setupLayout() {
        
        stackView.edgesToSuperview(excluding: .bottom, insets: .left(12) + .right(12), usingSafeArea: true)
        stackView.height(240)
       
    }
  
}



