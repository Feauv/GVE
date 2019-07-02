//
//  File.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 9/23/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class ProfileBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(displayP3Red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    let cellId = "cellId"
    let barImageNames = ["home", "shop", "gve", "heart", "profile"]
    
    var finController: FinancialController?
    
    override init(frame: CGRect){
        
        super.init(frame:frame)
        
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        finController?.goHome()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfileCell
        
        cell.barButton.image = UIImage(named: barImageNames[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width/5, height: frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ProfileCell: BaseCell {
    
    let barButton: UIImageView = {
        
        let bb = UIImageView()
        return bb
        
    }()
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(barButton)
        addConstraintsWithFormat(format: "H:[v0(23)]", views: barButton)
        addConstraintsWithFormat(format: "V:[v0(23)]", views: barButton)
        
        addConstraint(NSLayoutConstraint(item: barButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: barButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    
    
}
