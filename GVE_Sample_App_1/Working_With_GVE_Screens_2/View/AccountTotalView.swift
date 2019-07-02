//
//  AccountTotalView.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 9/23/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class AccountTotalView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var finController: FinancialController?
    var rUP = 0.0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AccountTotalCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: 100)
        
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
        
        collectionView.register(AccountTotalCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    func dropDownBang() {
        finController?.addvToggled()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class AccountTotalCell: BaseCell {
    
    var aTView: AccountTotalView?
    
    var accAmount: UILabel = {
        
        let accA = UILabel()
        accA.text = "+0.00"
        accA.font = UIFont(name: "HelveticaNeue-Ultralight", size: 45)
        accA.textColor = UIColor.white
        accA.textAlignment = NSTextAlignment.center
        return accA
        
    }()
    
    let gveAccountMessage: UILabel = {
        
        let gveAM = UILabel()
        gveAM.text = "in your GVE Account"
        gveAM.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        gveAM.textColor = UIColor.white
        gveAM.textAlignment = NSTextAlignment.center
        return gveAM
        
    }()
    
    private lazy var gradient: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(displayP3Red: 39/255, green: 170/255, blue: 225/255, alpha: 1.0).cgColor, UIColor(displayP3Red: 45/255, green: 212/255, blue: 223/255, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = self.bounds
        return gradientLayer
        
    }()
    
    override func setupViews() {
        addSubview(accAmount)
        addSubview(gveAccountMessage)
        
        layer.insertSublayer(gradient, at: 0)
        
        addConstraintsWithFormat(format: "H:|-(115)-[v0]-(115)-|", views: accAmount)
        addConstraintsWithFormat(format: "H:|-(115)-[v0]-(115)-|", views: gveAccountMessage)
        
        addConstraintsWithFormat(format: "V:|-(10)-[v0]-(0)-[v1]-(18)-|", views: accAmount, gveAccountMessage)
        
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                aTView?.dropDownBang()
            }
        }
    }
    
}


