//
//  DesignTestsController.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 9/21/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class DesignTestsController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ltBLue = UIColor(displayP3Red: 51/255, green: 255/255, blue: 221/255, alpha: 1.0)
        let mdBLue = UIColor(displayP3Red: 39/255, green: 170/255, blue: 225/255, alpha: 1.0)


        view.setGradientBackground(color1: ltBLue, color2: mdBLue)

    }
    
    /*let welcome: UIButton = {
        
        let w = UIButton()
        //w.imageView = UIImageView(image: UIImage(named: "Menu_1"))
        return w
        
    }()
    
    func setupViews() {
        
        view.addSubview(welcome)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: welcome)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: welcome)
        
    }*/


}
