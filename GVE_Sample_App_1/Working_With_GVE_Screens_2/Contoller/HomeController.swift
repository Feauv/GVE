//
//  HomeController.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 10/23/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var appLabel: UILabel!
    @IBOutlet var buttonContainerView: UIView!

    private lazy var gradient: CAGradientLayer = {
    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(displayP3Red: 51/255, green: 255/255, blue: 221/255, alpha: 1.0).cgColor,UIColor(displayP3Red: 39/255, green: 170/255, blue: 225/255, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = view.bounds
        return gradientLayer
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button = UIButton(frame: CGRect(x: 0, y: view.frame.height - 115, width: view.frame.width, height: 50))
        button.setTitle("Check Out the GVE Demo", for: [])
        button.setTitleColor(UIColor(displayP3Red: 51/255, green: 138/255, blue: 151/255, alpha: 1.0), for: [])
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 30))
        welcomeLabel.text = "WELCOME TO GVE"
        welcomeLabel.textColor = UIColor.white
        welcomeLabel.font = UIFont.init(name: "HelveticaNeue-UltraLight", size: 32)
        
        appLabel = UILabel(frame: CGRect(x: 0, y: (view.frame.height/4) * 3, width: view.frame.width, height: 30))
        appLabel.text = "Next Generation Philanthropy"
        appLabel.textColor = UIColor.white
        appLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 25)
        
        let x = (view.frame.width - 350)/2
        let y = (view.frame.height - 350)/2
        
        let centerImage: UIImageView = {
            
            let cI = UIImageView(frame: CGRect(x: x, y: y - 50, width: 350, height: 350))
            cI.image = UIImage(named: "WelcomeImage")
            return cI
            
        }()
        
        buttonContainerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        buttonContainerView.layer.insertSublayer(gradient, at: 0)
        
        button.isEnabled = true
        // let linkKitBundle  = Bundle(for: PLKPlaidLinkViewController.self)
        /*let linkKitVersion = linkKitBundle.object(forInfoDictionaryKey: "CFBundleShortVersionString")!
         let linkKitBuild   = linkKitBundle.object(forInfoDictionaryKey: kCFBundleVersionKey as String)!
         let linkKitName    = linkKitBundle.object(forInfoDictionaryKey: kCFBundleNameKey as String)!*/
        //label.text         = "Swift 4 — \(linkKitName) \(linkKitVersion)+\(linkKitBuild)"
        
        welcomeLabel.textAlignment = NSTextAlignment.center
        appLabel.textAlignment = NSTextAlignment.center
        button.titleLabel?.textAlignment = NSTextAlignment.center
        
        let shadowColor    = #colorLiteral(red: 0.01176470588, green: 0.1921568627, blue: 0.337254902, alpha: 0.1)
        buttonContainerView.layer.shadowColor   = shadowColor.cgColor
        buttonContainerView.layer.shadowOffset  = CGSize(width: 0, height: -1)
        buttonContainerView.layer.shadowRadius  = 2
        buttonContainerView.layer.shadowOpacity = 1
        
        view.addSubview(buttonContainerView)
        view.addSubview(button)
        view.addSubview(welcomeLabel)
        view.addSubview(centerImage)
        view.addSubview(appLabel)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func didTapButton(_ sender: Any?) {
        print("Yes")
        let layout = UICollectionViewFlowLayout()
        navigationController?.pushViewController(FinancialController(collectionViewLayout: layout), animated: true)
        navigationController?.isNavigationBarHidden = false
    }

}
