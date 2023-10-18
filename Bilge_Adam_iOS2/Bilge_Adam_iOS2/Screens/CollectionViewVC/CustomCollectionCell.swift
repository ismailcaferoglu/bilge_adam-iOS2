//
//  CustomCollectionCell.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 17.10.2023.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    
    weak var delegate:DataTransferDelegate?
    
    var closure:(()->Void)?
    
    private lazy var imgUser:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var lblUserName:UILabel = {
        let l = UILabel()
        l.textColor = .systemBlue
        l.font = UIFont(name: "Avenir-Medium", size: 14)
        return l
    }()
    
    private lazy var lblUserSurname:UILabel = {
        let l = UILabel()
        l.textColor = .systemBlue
        l.font = UIFont(name: "Avenir-Medium", size: 14)
        return l
    }()
    
    private lazy var lblBirthday:UILabel = {
        let l = UILabel()
        l.textColor = .systemBlue
        l.font = UIFont(name: "Avenir-Medium", size: 14)
        return l
    }()
    
    private lazy var lblAge:UILabel = {
        let l = UILabel()
        l.textColor = .systemBlue
        l.font = UIFont(name: "Avenir-Bold", size: 24)
        return l
    }()
    
    private lazy var btnSeeAll:UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    @objc func btnTapped(){
        closure?()
        delegate?.getData(data: "")
    }
    
    public func configure(object:User){
        imgUser.image = object.image
        lblUserName.text = object.name
        lblUserSurname.text = object.surname
        lblBirthday.text = String(object.birthday!)
        imgUser.isHidden = object.isBool!
        
    }
    
    private func setupViews(){
        self.contentView.backgroundColor = .systemGray
        self.contentView.addSubviews(imgUser,
                                     lblUserName,
                                     lblUserSurname,
                                     lblBirthday,
                                     lblAge)
        setupLayout()
    }
    
    private func setupLayout(){
        
        imgUser.snp.makeConstraints({ image in
            image.leading.equalToSuperview().offset(12)
            image.top.equalToSuperview().offset(12)
            image.bottom.equalToSuperview().offset(-12)
            image.width.equalTo(60)
        })
        
        lblUserName.snp.makeConstraints({ label in
            label.leading.equalTo(imgUser.snp.trailing).offset(12)
            label.top.equalTo(imgUser)
        })
        
        lblUserSurname.snp.makeConstraints({ label in
            label.leading.equalTo(imgUser.snp.trailing).offset(12)
            label.top.equalTo(lblUserName.snp.bottom).offset(8)
        })
        
        lblBirthday.snp.makeConstraints({ label in
            label.leading.equalTo(imgUser.snp.trailing).offset(12)
            label.top.equalTo(lblUserSurname.snp.bottom).offset(8)
        })
        
        lblAge.snp.makeConstraints({ label in
            label.centerY.equalToSuperview()
            label.trailing.equalToSuperview().offset(-12)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
