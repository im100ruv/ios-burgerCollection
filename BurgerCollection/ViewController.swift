//
//  ViewController.swift
//  BurgerCollection
//
//  Created by Im100ruv on 22/01/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let burgers = ["Big Mac","Quarter Pounder with Cheese","Bacon Clubhouse Burger","Double Quarter Pounder with Cheese","Hamburger","Cheeseburger"]
    
    let burgerImages: [UIImage] = [
            
            UIImage(named: "BigMac")!,
            UIImage(named: "QPWithCheese")!,
            UIImage(named: "BaconClubhouse")!,
            UIImage(named: "DoubleQPWithCheese")!,
            UIImage(named: "Hamburger")!,
            UIImage(named: "Cheeseburger")!
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/3)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return burgers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BurgerCVCell
        
        cell.imgBurger.image = burgerImages[indexPath.item]
        cell.lblBurgerName.text = burgers[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }


}

