//
//  OneTimeCell.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 10/11/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class OTCell: BaseCell {

    let welcomeMessage: UILabel = {
        
        let wM = UILabel()
        wM.text = "Welcome to the GVE Demo"
        wM.font = UIFont(name: "HelveticaNeue-Ultralight", size: 35)
        wM.textColor = .white
        wM.textAlignment = NSTextAlignment.center
        return wM
        
    }()
    
    let userMessage: UILabel = {
        
        let uM = UILabel()
        uM.text = "One-Time Payment is not yet apart of the demo at this time."
        uM.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        uM.textColor = .white
        uM.textAlignment = NSTextAlignment.center
        return uM
        
    }()
    

    
    override func setupViews() {
        addSubview(welcomeMessage)
        addSubview(userMessage)
        
        backgroundColor = UIColor(displayP3Red: 39/255, green: 170/255, blue: 225/255, alpha: 1.0)
        
        // Vertical Constraints
        addConstraintsWithFormat(format: "V:|-(200)-[v0(50)]-(10)-[v1(30)]-(350)-|", views: welcomeMessage, userMessage)
        
        // Horizontal Constraints
        addConstraintsWithFormat(format: "H:|-(5)-[v0]-(5)-|", views: welcomeMessage)
        addConstraintsWithFormat(format: "H:|-(5)-[v0]-(5)-|", views: userMessage)
        
    }
    
}
