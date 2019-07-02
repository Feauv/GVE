//
//  RoundUpFeedCell.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 10/16/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class RoundUpFeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    var roundUps: [RoundUp]?
    
    let cellId = "cellId"
    
    let tranBusiness = ["Starbooks", "App Stop", "Shelf Station", "Carista Parlor", "Targuest", "Krooger", "Penny Mace", "AT&P", "HB Hot Chicken", "Goodle"]
    let tranAmount = [13.44, 2.99, 59.44, 7.24, 35.77, 85.09, 105.77, 15.07, 9.99, 1.99, 13.44]
    var rUP = 0.0
    
    func addTransactions() {
        
        self.roundUps = [RoundUp]()
        //var rUP = 0.0
        
        for _ in 0...2 {
            
            let business = tranBusiness.randomElement()
            let amount = tranAmount.randomElement()
            
            let newRU = RoundUp()
            newRU.roundUpAmount = "+" + String(NSString(format: "%.2f", customLogic(amount: amount!)))
            newRU.transactionInfo = "$" + String(amount!) + " " + business!
            rUP = rUP + customLogic(amount: amount!)
            newRU.roundUpPool = "$" + String(NSString(format: "%.2f", rUP))
            self.roundUps?.insert(newRU, at: 0)
            
        }
        
    }
    
    @objc func demoTransaction(notification: NSNotification) {
        
        let business = tranBusiness.randomElement()
        let amount = tranAmount.randomElement()
        
        let newRU = RoundUp()
        newRU.roundUpAmount = "+" + String(NSString(format: "%.2f", customLogic(amount: amount!)))
        newRU.transactionInfo = "$" + String(amount!) + " " + business!
        rUP = rUP + customLogic(amount: amount!)
        newRU.roundUpPool = "$" + String(NSString(format: "%.2f", rUP))
        self.roundUps?.insert(newRU, at: 0)
        
        self.collectionView.reloadData()
        
        
        
    }
    
    func customLogic(amount: Double) -> Double {
        
        let roundUp = amount.rounded(.up)
        let roundUpAdd = roundUp - amount
        
        return roundUpAdd
        
    }
    
    override func setupViews() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(demoTransaction), name:NSNotification.Name(rawValue: "demo"), object: nil)
        
        addTransactions()
        
        super.setupViews()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        collectionView.register(RUCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RUCell
        
        cell.ru = roundUps?[indexPath.item]
        
        return cell
        
    }
    
    // Number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return roundUps?.count ?? 0
        
    }
    
    // Size of cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: 90)
        
    }
    
}
