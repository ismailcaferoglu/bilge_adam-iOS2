//
//  CustomCell.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 17.10.2023.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }

    
    public func configure(object:User,bool:Bool){
        //imgUser.image = object.image
        lblUserName.text = object.name
        lblUserSurname.text = object.surname
        lblBirthday.text = String(object.birthday!)
        
        if bool {
            imgUser.image = UIImage(named: "angry")
        }else {
            imgUser.image = UIImage(named: "happy")
        }
    }
    
    private func setupViews(){
        
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



