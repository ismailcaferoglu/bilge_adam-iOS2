//
//  BilgeAdamTextField.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 11.10.2023.
//

import UIKit

enum SideViewStatus {
    
    case left(image:UIImage?)
    case right(image:UIImage?)
    case none
    
    var definedSideView:UIView? {
        switch self {
        case .left(let image),.right(let image):
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.tintColor = #colorLiteral(red: 0.09411764706, green: 0.2901960784, blue: 0.1725490196, alpha: 1)
            //imageView.image = #imageLiteral(resourceName: "header.psd")
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
        
            let sideView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            imageView.center = sideView.center
            sideView.addSubview(imageView)
            return sideView
        case .none:
            return nil
        
        }
    }
    
    func setSideView(icon:UIImage? = nil)->UIView{
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.tintColor = #colorLiteral(red: 0.09411764706, green: 0.2901960784, blue: 0.1725490196, alpha: 1)
        //imageView.image = #imageLiteral(resourceName: "header.psd")
        imageView.image = icon
        imageView.contentMode = .scaleAspectFit
    
        let sideView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.center = sideView.center
        sideView.addSubview(imageView)
        
        return sideView
        
    }
}

enum FontStyle {
    
    case avenirBold(size:CGFloat)
    case avenirMedium(size:CGFloat)
    case timesRomanBold(size:CGFloat)
    case timesRomanRegular(size:CGFloat)
    
    var font:UIFont? {
        switch self {
        case .avenirBold(let size):
            return UIFont(name: "Avenir-Bold", size: size)
        case .avenirMedium(let size):
            return UIFont(name: "Avenir-Medium", size: size)
        case .timesRomanBold(let size):
            return UIFont(name: "TimesRoman-Bold", size: size)
        case .timesRomanRegular(let size):
            return UIFont(name: "TimesRoman-Regular", size: size)
        }
    }
}


class BilgeAdamTextField: UITextField {
    
    
    var sideView:SideViewStatus? = nil {
        didSet{
            defineSideViewLocation()
        }
    }
    
    var fontStyle:FontStyle = .avenirMedium(size: 16){
        didSet{
            self.font = fontStyle.font
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = fontStyle.font
        
        //self.font = UIFont(name: "Avenir-Medium", size: 14)
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.black.cgColor
        
        let attString = NSAttributedString(string:"Placeholder", attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Medium", size: 16)!,NSAttributedString.Key.foregroundColor:UIColor.red])
        
        self.attributedPlaceholder = attString
        
    }
    
    
     
    //MARK: -- SideView'ın hangi konuma yerleşeceğine karar verir.
    func defineSideViewLocation(){
        
            
        switch sideView {
        case .left:
            self.leftView = sideView?.definedSideView
            self.leftViewMode = .always
        case .right:
            self.rightView = self.sideView?.definedSideView
            self.rightViewMode = .always
        default:
            return
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
