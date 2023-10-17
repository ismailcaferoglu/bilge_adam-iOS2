//
//  AddSegmentedVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 16.10.2023.
//

import UIKit
import TinyConstraints

class AddSegmentedVC: UIViewController {
    
    private lazy var segmentedControl:UISegmentedControl = {
        let sc = UISegmentedControl(items: ["İndirimdekiler","Yeni Eklenenler","Çok Satanlar"])
        sc.selectedSegmentIndex = 0
        sc.selectedSegmentTintColor = .red
        sc.backgroundColor = .blue
        sc.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return sc
    }()
    
    
    lazy var tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
    lazy var longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGestureTapped))
    lazy var upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
    lazy var downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
    lazy var pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setGestures()
        
    }
    
    private func setGestures(){
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(longGesture)
        self.view.addGestureRecognizer(upSwipe)
        upSwipe.direction = .up
        self.view.addGestureRecognizer(downSwipe)
        downSwipe.direction = .down
        
        self.view.addGestureRecognizer(pinch)
        self.view.isUserInteractionEnabled = true
    }
    
    
    @objc func segmentChanged(sender:UISegmentedControl){
        print(sender.selectedSegmentIndex)
        if sender.selectedSegmentIndex == 0 {
            print("indirimdekiler görüntülendi.")
        }else if sender.selectedSegmentIndex == 1 {
            print("Yeni gelenler görüntülendi.")
        }else {
            print("çok satanlar görüntülendi.")
        }
    }
    
    @objc func pinchGesture(sender:UIPinchGestureRecognizer){
        print(sender.scale)
        print(sender.velocity)
        self.view.backgroundColor = .systemOrange
    }
    
    @objc func tapGesture(){
        self.view.backgroundColor = .systemRed
    }
    
    @objc func longGestureTapped(){
        self.view.backgroundColor = .white
    }
    
    @objc func swipeGesture(sender:UISwipeGestureRecognizer){
        
    
        if sender.direction == .down {
            self.view.backgroundColor = .systemBlue
        }
        
        if sender.direction == .up {
            self.view.backgroundColor = .systemGreen
        }
        
         
        
    }
    
    private func setupView(){
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.view.addSubview(segmentedControl)
        setupLayout()
    }
    
    private func setupLayout(){
        segmentedControl.topToSuperview(offset:24, usingSafeArea: true)
        segmentedControl.horizontalToSuperview(insets: .left(12) + .right(12))
        segmentedControl.height(40)
    }
 
}
