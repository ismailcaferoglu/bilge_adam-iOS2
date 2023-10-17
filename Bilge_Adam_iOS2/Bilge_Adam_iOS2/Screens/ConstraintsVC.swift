//
//  ConstraintsVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 12.10.2023.
//

import UIKit
import TinyConstraints
import SnapKit

class ConstraintsVC: UIViewController {
    
    private lazy var txtAydin:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Aydın bunu anlayacak"
        tf.backgroundColor = .systemBlue
        return tf
    }()
    
    private lazy var contentBaris:UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    private lazy var btnBurak:UIButton = {
        let b = UIButton()
        b.setTitle("Burak Bunu Beğendi", for: .normal)
        b.backgroundColor = .systemOrange
        return b
    }()
    
    private lazy var stackViewOguzhan:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    private lazy var lblSabri:UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.text = "asdasd"
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews(){
        
        self.view.backgroundColor = .black
        
        contentBaris.addSubviews(stackViewOguzhan,btnBurak)
        stackViewOguzhan.addArrangedSubviews(lblSabri,
                                             txtAydin)
    
        
        self.view.addSubview(contentBaris)
        
        setupLayout()
    }
    
    private func setupLayout(){
        
        //MARK: -- SnapKit
//        contentBaris.snp.makeConstraints({ view in
//            view.leading.equalToSuperview()
//            view.trailing.equalToSuperview()
//            view.bottom.equalToSuperview()
//            view.height.equalToSuperview().multipliedBy(0.7)
//        })
//        
//        txtAydin.snp.makeConstraints({ $0.height.equalTo(50)})
//        
//        stackViewOguzhan.snp.makeConstraints({ stack in
//            stack.top.equalToSuperview().offset(24)
//            stack.leading.equalToSuperview().offset(50)
//            stack.trailing.equalToSuperview().offset(-12)
//        })
//        
//        btnBurak.snp.makeConstraints({ button in
//            button.width.equalTo(100)
//            button.height.equalTo(50)
//            button.top.equalTo(stackViewOguzhan.snp.bottom).offset(24)
//            button.leading.equalTo(stackViewOguzhan)
//        })
        
        //MARK: -- TinyConstraints
        
        contentBaris.edgesToSuperview(excluding: .top)
        contentBaris.heightToSuperview(multiplier: 0.70)
        
        txtAydin.height(50)
        stackViewOguzhan.horizontalToSuperview(insets: .left(12) + .right(12))
        stackViewOguzhan.topToSuperview(offset:24)
        
        btnBurak.bottomToSuperview(offset: -24,usingSafeArea: true)
        btnBurak.centerX(to: stackViewOguzhan)
        btnBurak.height(50)
        btnBurak.width(250)
        
        
        
        
    }
    

}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ConstraintsVC_Preview: PreviewProvider {
    static var previews: some View{
         
        ConstraintsVC().showPreview()
    }
}
#endif
