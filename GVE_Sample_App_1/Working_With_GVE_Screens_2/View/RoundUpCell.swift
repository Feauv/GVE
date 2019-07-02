//
//  File.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 9/21/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class RUCell: BaseCell {
    
    var ru: RoundUp? {
        didSet {
            ruAmount.text = ru?.roundUpAmount
            tranInfo.text = ru?.transactionInfo
            ruPool.text = ru?.roundUpPool
        }
    }
    
    let ruAmount: UILabel = {
        
        let ruLabel = UILabel()
        //ruLabel.text = "+0.56"
        ruLabel.font = UIFont(name: "HelveticaNeue-Ultralight", size: 45)
        return ruLabel
        
    }()
    
    let tranInfo: UILabel = {
        
        let tranLabel = UILabel()
        //tranLabel.text = "$13.44" + " " + "Starbooks"
        tranLabel.font = UIFont(name: "HelveticaNeue-Ultralight", size: 15)
        return tranLabel
        
    }()
    
    let ruPool: UILabel = {
        
        let ruPoolLabel = UILabel()
        //ruPoolLabel.text = "$18.69"
        ruPoolLabel.font = UIFont(name: "HelveticaNeue-Ultralight", size: 15)
        ruPoolLabel.textAlignment = NSTextAlignment.right
        return ruPoolLabel
        
    }()
    
    /*let date: UILabel = {
        
        let dateLabel = UILabel()
        dateLabel.text = "March" + "31" + "2017"
        return dateLabel
        
    }()*/
    
    let seperatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
        
    }()
    
    override func setupViews() {
        addSubview(ruAmount)
        addSubview(tranInfo)
        addSubview(ruPool)
        //addSubview(date)
        addSubview(seperatorView)
        
        // Vertical Constraints
        addConstraintsWithFormat(format: "V:|-(13)-[v0]-(5)-[v1(20)]-(5)-[v2(1)]|", views: ruAmount, tranInfo, seperatorView)
        addConstraintsWithFormat(format: "V:|-(60)-[v0]-(14)-|", views: ruPool)
        
        // Horizontal Constraints
        addConstraintsWithFormat(format: "H:|-(16)-[v0]-(150)-|", views: ruAmount)
        addConstraintsWithFormat(format: "H:|-(16)-[v0(200)]", views: tranInfo)
        addConstraintsWithFormat(format: "H:[v0(80)]-(16)-|", views: ruPool)
        addConstraintsWithFormat(format: "H:|[v0]|", views: seperatorView)
        
        
    }
    
}
