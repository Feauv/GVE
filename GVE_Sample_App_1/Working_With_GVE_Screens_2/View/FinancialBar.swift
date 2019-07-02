//
//  FinancialBar.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 9/21/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class FinancialBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    let cellId = "cellId"
    let barHeadings = ["Round-Up", "One-Time", "Recurring", "History"]
    
    var finController: FinancialController?
    
    override init(frame: CGRect){
        
        super.init(frame:frame)
        
        collectionView.register(FinancialCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
        
    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        finController?.scrollToBarIndex(barIndex: indexPath.item)
        finController?.scrollViewCheck(index: Int(indexPath.item))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FinancialCell
        
        cell.barButtonLabel.text = barHeadings[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        if (indexPath.row == 0){
            cell.barButtonLabel.textColor = UIColor(displayP3Red: (40/255), green: (174/255), blue: (224/255), alpha: 1.0)
        } else {
            cell.barButtonLabel.textColor = UIColor.white
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width/4, height: frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class FinancialCell: BaseCell {
    
    let barButtonLabel: UILabel = {
        
        let bbl = UILabel()
        bbl.font = UIFont(name: "HelveticaNeue-Regular", size: 12)
        bbl.textColor = UIColor(displayP3Red: (40/255), green: (174/255), blue: (224/255), alpha: 1.0)
        bbl.textAlignment = NSTextAlignment.center
        return bbl
        
    }()
    
    private lazy var gradient: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(displayP3Red: 45/255, green: 212/255, blue: 223/255, alpha: 1.0).cgColor, UIColor(displayP3Red: 48/255, green: 232/255, blue: 222/255, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = self.bounds
        return gradientLayer
        
    }()
    
    override var isSelected: Bool {
        didSet {
            
            if isSelected {
                gradient.removeFromSuperlayer()
                backgroundColor = UIColor.white
                barButtonLabel.textColor = UIColor(displayP3Red: (40/255), green: (174/255), blue: (224/255), alpha: 1.0)
            } else {
                layer.insertSublayer(gradient, at: 0)
                barButtonLabel.textColor = UIColor.white
            }
            
        }
    }
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(barButtonLabel)
        addConstraintsWithFormat(format: "H:[v0(80)]", views: barButtonLabel)
        addConstraintsWithFormat(format: "V:[v0(20)]", views: barButtonLabel)
        
        layer.insertSublayer(gradient, at: 0)
        
        addConstraint(NSLayoutConstraint(item: barButtonLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: barButtonLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    
    
}
