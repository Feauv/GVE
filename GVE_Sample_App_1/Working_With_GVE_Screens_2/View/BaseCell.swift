//
//  BaseCell.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 10/11/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
        
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
