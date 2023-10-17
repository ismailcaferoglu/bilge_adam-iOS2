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
        User(image: UIImage(named: "user1"), name: "John", surname: "Doe", birthday: 1990),
        User(image: UIImage(named: "user2"), name: "Jane", surname: "Smith", birthday: 1985),
        User(image: UIImage(named: "user3"), name: "Alice", surname: "Johnson", birthday: 2000),
        User(image: UIImage(named: "user4"), name: "Bob", surname: "Williams", birthday: 1992),
        User(image: UIImage(named: "user5"), name: "Ella", surname: "Brown", birthday: 1988),
        User(image: UIImage(named: "user6"), name: "James", surname: "Lee", birthday: 1995),
        User(image: UIImage(named: "user7"), name: "Grace", surname: "Davis", birthday: 1998),
        User(image: UIImage(named: "user8"), name: "Michael", surname: "Miller", birthday: 1980),
        User(image: UIImage(named: "user9"), name: "Olivia", surname: "Anderson", birthday: 2002),
        User(image: UIImage(named: "user10"), name: "William", surname: "Wilson", birthday: 1991)
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
            return 50
        }else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Name"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer Name"
    }
}

extension TableViewVC:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }else {
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
            cell.configure(object: "Ahmet")
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Test"
            return cell
        }
        
    }
}


