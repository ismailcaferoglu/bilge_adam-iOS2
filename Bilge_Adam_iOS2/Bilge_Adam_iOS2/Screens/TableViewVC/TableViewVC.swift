//
//  TableViewVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 17.10.2023.
//

import UIKit
import TinyConstraints

class TableViewVC: UIViewController {
    
    
     var users: [User] = [
         User(image: UIImage(named: "angry"), name: "John", surname: "Doe", birthday: 1990,isBool: true),
         User(image: UIImage(named: "angry"), name: "Jane", surname: "Smith", birthday: 1985,isBool: false),
         User(image: UIImage(named: "angry"), name: "Alice", surname: "Johnson", birthday: 2000,isBool: false),
         User(image: UIImage(named: "angry"), name: "Bob", surname: "Williams", birthday: 1992,isBool: true),
         User(image: UIImage(named: "angry"), name: "John", surname: "Doe", birthday: 1990,isBool: true),
         User(image: UIImage(named: "angry"), name: "Jane", surname: "Smith", birthday: 1985,isBool: false),
         User(image: UIImage(named: "angry"), name: "Alice", surname: "Johnson", birthday: 2000,isBool: true),
         User(image: UIImage(named: "angry"), name: "Bob", surname: "Williams", birthday: 1992,isBool: true)
     ]
    
    
    
    private lazy var tableView:UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.register(CustomCell.self, forCellReuseIdentifier: "customCell")
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    /// Bu fonksiyon döküman hazırlamak için tanımlanmıştır.
    /// - Parameters:
    ///   - params: String bir değeri çalıştığı yerden alır.
    ///   - param: Integer değeri çalışıtğı yerden alır.
    /// - Returns: Tüm parametreleri hesaplayarak bir veri oluşturur.
    func setDocument(params:String, param:Int)->String {
        return ""
    }
    
    
    private func setupViews(){
        
        self.view.addSubviews(tableView)
        setupLayout()
    }
   
    private func setupLayout(){
        tableView.edgesToSuperview()
    }
    
    
}


extension TableViewVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }else {
            return 100
        }
    }
    
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Name"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer Name"
    }
     */
}

extension TableViewVC:UITableViewDataSource {
    
    //MARK: -- Kaç tane section olacağını belirler.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //MARK: -- Her bir section içinde kaç adet cell olacağına karar verir.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
        
        /*
        if section == 0 {
            return 5
        }else {
            return 10
        }
        */
    }
    
    
    //MARK: -- Her bir satıra denk gelen cell'lerin hangisi olacağı ve veri kaynağını belirler
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        let object = users[indexPath.row]
        cell.configure(object: object, bool: object.isBool!)
        
        return cell
        
        
        /*
         if indexPath.section == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
             cell.configure(object: "Ahmet")
             return cell
         }else {
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
             cell.textLabel?.text = "Test"
             return cell
         }
         */
        
        
    }
}


