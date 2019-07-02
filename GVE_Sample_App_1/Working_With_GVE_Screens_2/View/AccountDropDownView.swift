//
//  AccountDropDownViewCell.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 10/8/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class AccountDropDownView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AccountDropDownViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: 110)
        
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    override init(frame: CGRect){
        
        super.init(frame:frame)
        
        collectionView.register(AccountDropDownViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class AccountDropDownViewCell: BaseCell {
    
    //var triggerAmount = 5
    
    let achStatement: UILabel = {
        
        let ach = UILabel()
        ach.text = "When round-ups reach $" + String(NSString(format: "%.2f", 5)) + "an ACH payment will automatically process if the available funds are present in the attached account"
        ach.textColor = UIColor.white
        ach.font = UIFont(name: "Helvetica-Light", size: 12)
        ach.lineBreakMode = .byWordWrapping
        ach.numberOfLines = 3
        return ach
        
    }()
    
    let enableLabel: UILabel = {
        
        let eL = UILabel()
        eL.text = "Enable Round-Ups"
        eL.textColor = UIColor.white
        eL.font = UIFont(name: "Helvetica-Light", size: 12)
        return eL
        
    }()
    
    let enableSwitch: UISwitch = {
        
        let eS = UISwitch()
        return eS
        
    }()
    
    override func setupViews() {
        addSubview(achStatement)
        addSubview(enableLabel)
        addSubview(enableSwitch)
        
        backgroundColor = UIColor(displayP3Red: 39/255, green: 170/255, blue: 225/255, alpha: 1.0)
        
        addConstraintsWithFormat(format: "H:|-(20)-[v0]-(80)-|", views: achStatement)
        addConstraintsWithFormat(format: "H:|-(20)-[v0]-[v1]-(20)-|", views: enableLabel, enableSwitch)
        
        addConstraintsWithFormat(format: "V:|-(10)-[v0(45)]-(20)-[v1(15)]-(25)-|", views: achStatement, enableLabel)
        addConstraintsWithFormat(format: "V:[v0]-(15)-|", views: enableSwitch)
    }
    
}
