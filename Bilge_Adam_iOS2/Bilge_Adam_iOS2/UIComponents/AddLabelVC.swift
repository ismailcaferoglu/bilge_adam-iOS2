//
//  ViewController2.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 3.10.2023.
//

import UIKit
import SnapKit
import TinyConstraints

class AddLabelVC: UIViewController {
    
    //MARK: -- Views
    private lazy var lblWellcomeText:UILabel = {
        let label = UILabel()
        label.text = "Hoşgeldiniz.Hoşgeldiniz."
        label.textColor = .blue
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Medium", size: 24)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblDescriptionText:UILabel = {
        let label = UILabel()
        label.text = "Bilge Adam uygulamasına hoşgeldiniz"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.minimumScaleFactor = 12
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        return label
    }()
    
    private lazy var lblName:UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .white
        label.numberOfLines = 0
        label.backgroundColor = .systemBlue
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        return label
    }()
    
    private lazy var lblSurname:UILabel = {
        let label = UILabel()
        label.text = "Surname"
        label.textColor = .white
        label.numberOfLines = 1
        label.backgroundColor = .systemBlue
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        return label
    }()
    
    private lazy var lblAge:UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textColor = .white
        label.numberOfLines = 1
        label.backgroundColor = .systemBlue
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        return label
    }()
    
    private lazy var stackView:UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    
    private lazy var dismissButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "figure.kickboxing"), for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()

    
    //MARK: -- Life Cycles
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
       setupViews()
    }
    
    
    //MARK: -- View Methods
    private func setupViews(){
        
        self.view.backgroundColor = .red
        
        self.view.addSubview(lblWellcomeText)
        self.view.addSubview(lblDescriptionText)
        self.view.addSubview(dismissButton)
        self.view.addSubview(stackView)
        
        stackView.addArrangedSubview(lblName)
        stackView.addArrangedSubview(lblSurname)
        stackView.addArrangedSubview(lblAge)
       
        
        setupLayout()
    }
    
    @objc func dismissButtonTapped(){
         
        self.dismiss(animated: true, completion: {
            print("Bu sayfa kapatıldı.")
        })
    }
    
    private func setupLayout(){
        
        //MARK: -- Native
//        lblWellcomeText.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
//        lblWellcomeText.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -24).isActive = true
//        lblWellcomeText.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 24).isActive = true
        
        //MARK: -- TinyConstraints
        lblWellcomeText.centerXToSuperview()
        lblWellcomeText.topToSuperview(offset:24,usingSafeArea: true)
        
        lblDescriptionText.snp.makeConstraints({
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalTo(lblWellcomeText.snp.bottom).offset(24)
            
        })
         
        //Superview'ın x ve y koordinatları bazında tam ortasına yerleştirir.
        //lblDescriptionText.centerInSuperview()
        
        stackView.horizontalToSuperview(insets: .left(16) + .right(16))
        stackView.topToBottom(of: lblDescriptionText,offset: 24)
        
//        lblName.leadingToSuperview(offset:8)
//        lblName.width(150)
//        lblName.topToBottom(of: lblDescriptionText, offset: 32)
//        
//        lblSurname.leadingToTrailing(of: lblName, offset: 24)
//        lblSurname.trailingToSuperview(offset:24)
//        lblSurname.top(to: lblName)
       
        //MARK: -- SnapKit
//        lblWellcomeText.snp.makeConstraints({ label in
//            label.leading.equalToSuperview().offset(24)
//            label.trailing.equalToSuperview().offset(24)
//            label.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
//        })
        
        dismissButton.centerInSuperview()
        dismissButton.width(200)
        dismissButton.height(50)
        
    }
    
 

}
