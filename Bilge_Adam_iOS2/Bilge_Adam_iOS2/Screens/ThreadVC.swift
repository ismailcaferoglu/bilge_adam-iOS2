//
//  
//  ThreadVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 17.11.2023.
//
//
import UIKit
import TinyConstraints

@available(iOS 17, *)
#Preview{
    return ThreadVC()
}

class ThreadVC: UIViewController {
    
    //MARK: -- Properties
    let dispatchGroup = DispatchGroup()
    
    //MARK: -- Views
    
    
    //MARK: -- Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupViews()
        
        
        dispatchGroup.enter()
           
               print("İşlem başladı.count:background")
//               APIService().fetchPopularPhotos(complete: { success,object,error in
//                   print("İşlem bitt.count:background")
//                   self.dispatchGroup.leave()
//                   print("İşlemden çıkıldı:background")
//               })
               
              
               
               dispatchGroup.enter()
               print("İşlem başladı.count:utility")
//               APIService().fetchPopularPhoto(complete: { success,object,error in
//                   print("İşlem bitt.count:utility")
//                   
//                    
//                   self.dispatchGroup.leave()
//                   print("İşlemden çıkıldı:utility")
//                   
//               })

               
               
               print("Tüm işlemlerin bitmesi bekleniyor")
               dispatchGroup.notify(queue: .main) {
//                   APIService().getPhoto(complete: { success,object,error in
//                       
//                       self.lblWelcome.text = object.first?.name
//                       
//                   })
               }

       
    }
    
    //MARK: -- Component Actions
    
    
    //MARK: -- Private Methods
    func getData(){
        DispatchQueue.global(qos: .background).async {
            // AF.request...
        }
    }
    
    //MARK: -- UI Methods
    func setupViews() {
        
        self.view.addSubviews()
        setupLayout()
    }
    
    func setupLayout() {
      
       
    }
  
}
