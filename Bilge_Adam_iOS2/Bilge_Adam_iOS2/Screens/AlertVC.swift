//
//  AlertVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 12.10.2023.
//

import UIKit
import SnapKit

class AlertVC: UIViewController {
    
    
    private lazy var btnShowAlert:UIButton = {
        let button = UIButton()
        button.setTitle("Hata Göster", for: .normal)
        button.addTarget(self, action: #selector(btnShowAlertTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        showAlert(title: "Hata", message: "Sunucuya erişim başarısız oldu.")
        setupViews()
    }
    
    @objc func btnShowAlertTapped(){
        
       
        addActionSheet()
    }
    
    private func showAlert(title:String,message:String) {
        
        let btnCancel = UIAlertAction(title: "Vazgeç", style: .destructive)
        let btnRetry = UIAlertAction(title: "Yeniden Dene", style: .default, handler: { action in
            self.showAlert(title: "Hata", message: "Yine olmadı")
        })
        
        //btnCancel.isEnabled = false
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(btnCancel)
        alert.addAction(btnRetry)
        
        self.present(alert, animated: true)
    }
    
    private func addActionSheet(){
        
        let deleteAll = UIAlertAction(title: "Tüm içerikleri sil", style: .default)
        let deleteNetwork = UIAlertAction(title: "Ağ ayarlarını sil", style: .default)
        let cancel = UIAlertAction(title: "Vazgeç", style: .cancel)
        
        let actionSheet = UIAlertController(title: "Seçim Yap", message: "Yapmak istediğiniz işleme dokunun.", preferredStyle: .actionSheet)
        
        actionSheet.addAction(deleteAll)
        actionSheet.addAction(deleteNetwork)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
    }
    
    private func setupViews(){
        
        self.view.backgroundColor = .white
        self.view.addSubviews(btnShowAlert)
        setupLayout()
    }
    
    private func setupLayout(){
        btnShowAlert.snp.makeConstraints({ button in
            button.centerX.equalToSuperview()
            button.centerY.equalToSuperview()
            button.width.equalTo(200)
            button.height.equalTo(50)
        })
    }
   

}
