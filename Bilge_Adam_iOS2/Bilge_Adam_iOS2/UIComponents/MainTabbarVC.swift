//
//  MainTabbarVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 16.10.2023.
//

import UIKit

class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = setupControllers()
        self.selectedIndex = 2
        self.tabBar.tintColor = .systemRed
        self.tabBar.unselectedItemTintColor = .darkGray
        self.tabBar.backgroundColor = UIColor(named: "backgroundColor")
        self.tabBar.isTranslucent = false

    }
    
    
    private func setupControllers()->[UIViewController]{
        
        
        let alertVC = AlertVC()
        let alertNC = UINavigationController(rootViewController: alertVC)
        let imageAlert =  UIImage(systemName: "bell")
        let selectedImageAlert = UIImage(systemName: "bell.fill")
       
        alertVC.tabBarItem = UITabBarItem(title: "Alert", image: imageAlert, selectedImage: selectedImageAlert)
        
        let buttonVC = AddButtonVC()
        let buttonNC = UINavigationController(rootViewController: buttonVC)
        let imageButton =  UIImage(systemName: "dumbbell")
        let selectedImageButton = UIImage(systemName: "dumbbell.fill")
        buttonVC.tabBarItem = UITabBarItem(title: "Button", image: imageButton, selectedImage: selectedImageButton)
        
        let textFieldVC = AddTextFieldVC()
        let textFieldNC = UINavigationController(rootViewController: textFieldVC)
        let imageTextField =  UIImage(systemName: "flag.2.crossed")
        let selectedImageTextField = UIImage(systemName: "flag.2.crossed.fill")
        textFieldVC.tabBarItem = UITabBarItem(title: "Text Field", image: imageTextField, selectedImage: selectedImageTextField)
        
        let addSegmentedVC = AddSegmentedVC()
        let addSegmentedNC = UINavigationController(rootViewController: addSegmentedVC)
        let imageAddSegmented =  UIImage(systemName: "person")
        let selectedImageAddSegmented = UIImage(systemName: "person.fill")
        addSegmentedVC.tabBarItem = UITabBarItem(title: "Segment", image: imageAddSegmented, selectedImage: selectedImageAddSegmented)
        
        
        
        return [alertNC, buttonNC, textFieldNC, addSegmentedNC]
    }
    

}
