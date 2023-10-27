//
//  CollectionViewVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 17.10.2023.
//

import UIKit
import TinyConstraints

class CollectionViewVC: UIViewController {
    
    var users: [User] = [
        User(image: UIImage(named: "angry"), name: "John", surname: "Doe", birthday: 1990,isBool: true),
        User(image: UIImage(named: "angry"), name: "Jane", surname: "Smith", birthday: 1985,isBool: false),
        User(image: UIImage(named: "angry"), name: "Alice", surname: "Johnson", birthday: 2000,isBool: false),
        User(image: UIImage(named: "angry"), name: "Bob", surname: "Williams", birthday: 1992,isBool: true),
        User(image: UIImage(named: "angry"), name: "John", surname: "Doe", birthday: 1990,isBool: true),
        User(image: UIImage(named: "angry"), name: "Jane", surname: "Smith", birthday: 1985,isBool: false),
        User(image: UIImage(named: "angry"), name: "Alice", surname: "Johnson", birthday: 2000,isBool: true),
        User(image: UIImage(named: "angry"), name: "Bob", surname: "Williams", birthday: 1992,isBool: true),
        User(image: UIImage(named: "angry"), name: "John", surname: "Doe", birthday: 1990,isBool: true),
        User(image: UIImage(named: "angry"), name: "Jane", surname: "Smith", birthday: 1985,isBool: false),
        User(image: UIImage(named: "angry"), name: "Alice", surname: "Johnson", birthday: 2000,isBool: false),
        User(image: UIImage(named: "angry"), name: "Bob", surname: "Williams", birthday: 1992,isBool: true),
        User(image: UIImage(named: "angry"), name: "John", surname: "Doe", birthday: 1990,isBool: true),
        User(image: UIImage(named: "angry"), name: "Jane", surname: "Smith", birthday: 1985,isBool: false),
        User(image: UIImage(named: "angry"), name: "Alice", surname: "Johnson", birthday: 2000,isBool: true),
        User(image: UIImage(named: "angry"), name: "Bob", surname: "Williams", birthday: 1992,isBool: true)
    ]

    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
    
        let lay = makeCollectionViewLayout()
        
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lay)
       
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "cell")
       
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews(){
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.view.addSubviews(collectionView)
        setupLayout()
    }
    
    private func setupLayout(){
        collectionView.edgesToSuperview(usingSafeArea: true)
       
    }
}


extension CollectionViewVC:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //print(indexPath)
    }
    /*
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         return
     }
     */
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: (collectionView.frame.width - 20), height: (collectionView.frame.height-10))
    }
}


extension CollectionViewVC:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionCell
        let object = users[indexPath.row]
        
        //MARK: -- Bunlar başka konular. :)
        //cell.delegate = self
        cell.closure = {
            self.navigationController?.pushViewController(AlertVC(), animated: true)
        }
        
        cell.configure(object:object)
        
        return cell
    }
}


extension CollectionViewVC {
    
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        
        UICollectionViewCompositionalLayout {
            [weak self] sectionIndex, environment in
            
            if sectionIndex == 0 {
                return self?.makeListLayoutSection()
            }else {
                return self?.makeSliderLayoutSection()
            }
            
        }
    
        
        //return UICollectionViewCompositionalLayout(section: layoutType.layout)
        
    }
    
    func makeSliderLayoutSection() -> NSCollectionLayoutSection {
    
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [item] )
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        return layoutSection
    }
    
    func makeListLayoutSection() -> NSCollectionLayoutSection {
    
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
       
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [item] )
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)
        layoutSection.interGroupSpacing = 16
        
        return layoutSection
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CollectionViewVC_Preview: PreviewProvider {
    static var previews: some View{
         
        CollectionViewVC().showPreview()
    }
}
#endif
