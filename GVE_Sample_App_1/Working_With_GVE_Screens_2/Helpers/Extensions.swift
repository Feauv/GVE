//
//  Extensions.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 9/21/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat (format: String, views: UIView...) {
        
        var viewDictionary = [String:UIView]()
        
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
        
    }
    
    func setGradientBackground( color1: UIColor, color2: UIColor) -> CAGradientLayer{
        
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = bounds
        gradientlayer.colors = [color1.cgColor, color2.cgColor]
        gradientlayer.locations = [0.0, 1.0]
        gradientlayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        return gradientlayer
        
    }
    
}

extension Bool {
    
    mutating func toggle() {
        self = !self
    }
    
}
