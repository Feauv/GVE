//
//  ViewController.swift
//  Working_With_GVE_Screens_2
//
//  Created by Nick J Grove on 9/19/18.
//  Copyright © 2018 Nick Grove. All rights reserved.
//

import UIKit
import Dispatch

class FinancialController: UICollectionViewController,  UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var accountTotalView: UIView!
    
    @IBOutlet var ammountLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var dropDownButton: UIButton!
    
    private lazy var gradient: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(displayP3Red: 39/255, green: 170/255, blue: 225/255, alpha: 1.0).cgColor, UIColor(displayP3Red: 45/255, green: 212/255, blue: 223/255, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = accountTotalView.bounds
        return gradientLayer
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addTransactions()

        let imageView = UIImageView(image: UIImage(named: "GVE_1"))
        navigationItem.titleView = imageView
        
        let demo = UIBarButtonItem(title: "Test", style: .done, target: self, action: #selector(runDemo))
        demo.tintColor = UIColor.white
        
        accountTotalView = UIView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 100))
        accountTotalView.layer.insertSublayer(gradient, at: 0)
        
        ammountLabel = UILabel(frame: CGRect(x: 0, y: 65, width: view.frame.width, height: 50))
        ammountLabel.text = "+0.00"
        ammountLabel.textColor = .white
        ammountLabel.font = UIFont(name: "HelveticaNeue-Ultralight", size: 45)
        ammountLabel.textAlignment = .center
        
        messageLabel = UILabel(frame: CGRect(x: 0, y: 120, width: view.frame.width, height: 20))
        messageLabel.text = "in your GVE account"
        messageLabel.textColor = .white
        messageLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        messageLabel.textAlignment = .center
        
        navigationItem.leftBarButtonItems = [menu,demo]
        navigationItem.rightBarButtonItem = search

        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 48/255, green: 232/255, blue: 222/255, alpha: 1.0)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false;
        
        UIInit()
        //super.setNeedsStatusBarAppearanceUpdate()
        view.addSubview(accountTotalView)
        view.addSubview(ammountLabel)
        view.addSubview(messageLabel)
        
    }
    
    /* UI Initializations */
    
    // Calls all user interface setup functions
    private func UIInit() {
        
        setupCollectionView()
        setupFinancialBar()
        setupProfileBar()
//        setupAccountTotalView()
//        setupAccountDropDownView()
        setupOneTimeSearchView()
        
    }
    
    let cellId = "cellId"
    let FeedcellId = "FeedcellId"
    let OTcellId = "OTcellId"
    let REcellId = "REcellId"
    let HcellId = "HcellId"
    
    // Sets up view where transaction info and round ups will be
    private func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        //let layout = UICollectionViewFlowLayout()
        //collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(RoundUpFeedCell.self, forCellWithReuseIdentifier: "FeedcellId")
        collectionView?.register(OTCell.self, forCellWithReuseIdentifier: "OTcellId")
        collectionView?.register(RECell.self, forCellWithReuseIdentifier: "REcellId")
        collectionView?.register(HCell.self, forCellWithReuseIdentifier: "HcellId")
    
        
        collectionView?.contentInset = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)
        
        collectionView?.isPagingEnabled = true;
        
    }
    
    func scrollToBarIndex(barIndex: Int) {
        
        let indexPath = IndexPath(item: barIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
        
    }
    
    // Sets up tab bar view that has all financial tabs
    private func setupFinancialBar() {
        
        view.addSubview(finBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: finBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: finBar)
        
    }
    
    // Sets up bottom profile bar that has all of your profile navigational buttons
    private func setupProfileBar() {
        
        view.addSubview(proBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: proBar)
        view.addConstraintsWithFormat(format: "V:[v0(60)]|", views: proBar)
        
    }
    
    // Sets up view that shows the amount that is in your GVE account
    private func setupAccountTotalView() {
        
        view.addSubview(accTotView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: accTotView)
        view.addConstraintsWithFormat(format: "V:|-50-[v0(100)]", views: accTotView)
        
    }
    
    // Sets up the drop down menu that will show the user their account settings for round ups
    private func setupAccountDropDownView() {
        
        view.addSubview(accDDView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: accDDView)
        view.addConstraintsWithFormat(format: "V:|-150-[v0(110)]", views: accDDView)
        
    }
    
    private func setupOneTimeSearchView() {
        
        view.addSubview(oTSView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: oTSView)
        view.addConstraintsWithFormat(format: "V:|-150-[v0(110)]", views: oTSView)
        
    }
    
    //let info = UIButton(title: "i", style: .done, target: self, action: #selector(addvToggled))
    
    /* End */
    
    /* Round Up Variables */
    
    // Our RoundUp NSObject for the cells
    // var roundUps: [RoundUp]?
    
    // Random Transaction Businesses and Amounts that the demo chooses from for testing
    // let tranBusiness = ["Starbooks", "App Stop", "Shelf Station", "Carista Parlor", "Targuest", "Krooger", "Penny Mace", "AT&P", "HB Hot Chicken", "Goodle"]
    // let tranAmount = [13.44, 2.99, 59.44, 7.24, 35.77, 85.09, 105.77, 15.07, 9.99, 1.99, 13.44]
    // var rUP = 0.0
    
    /* End */
    
    /* UI Variables */
    
    // Search bar button in the upper right
    let search: UIBarButtonItem = {
        
        let s = UIBarButtonItem()
        s.image = UIImage(named: "Search_1")
        s.tintColor = UIColor.white
        return s
        
    }()
    
    // Menu bar button in the upper left
    let menu: UIBarButtonItem = {
        
        let m = UIBarButtonItem()
        m.image = UIImage(named: "Menu_1")
        m.tintColor = UIColor.white
        return m
        
    }()
    
    // Tab bar that will have our financial tabs
    lazy var finBar: FinancialBar = {
        
        let fb = FinancialBar()
        fb.finController = self
        return fb;
        
    }()

    // Profile bar that has everything navigate from the financial screen
    lazy var proBar: ProfileBar = {
        
        let pb = ProfileBar()
        pb.finController = self
        return pb;
    
    }()
    
    // View for the GVE account total
    lazy var accTotView: AccountTotalView = {
     
        let atv = AccountTotalView()
        atv.finController = self
        return atv
     
    }()
    
    // AccountTotalView drop down view
    let accDDView: AccountDropDownView = {
        
        let addv = AccountDropDownView()
        addv.isHidden = true
        //addv.isHidden.toggle()
        return addv
        
    }()
    
    let oTSView: OneTimeSearchView = {
        
        let otsv = OneTimeSearchView()
        otsv.isHidden = true
        //addv.isHidden.toggle()
        return otsv
        
    }()
    
    // Initial transactions that are made for the demo
    /*func addTransactions() {
        
        self.roundUps = [RoundUp]()
        var rUP = 0.0
        
        for _ in 0...2 {
            
            let business = tranBusiness.randomElement()
            let amount = tranAmount.randomElement()
            
            let newRU = RoundUp()
            newRU.roundUpAmount = "+" + String(NSString(format: "%.2f", customLogic(amount: amount!)))
            newRU.transactionInfo = "$" + String(amount!) + " " + business!
            rUP = rUP + customLogic(amount: amount!)
            newRU.roundUpPool = "$" + String(NSString(format: "%.2f", rUP))
            self.roundUps?.insert(newRU, at: 0)
            
        }
        
    }*/
    
    // When test button is hit it creates a new transaction for round up
    @objc private func runDemo() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "demo"), object: nil)
        
    }
    /*@objc private func runDemo() {
        
        let business = tranBusiness.randomElement()
        let amount = tranAmount.randomElement()
        
        let newRU = RoundUp()
        newRU.roundUpAmount = "+" + String(NSString(format: "%.2f", customLogic(amount: amount!)))
        newRU.transactionInfo = "$" + String(amount!) + " " + business!
        rUP = rUP + customLogic(amount: amount!)
        newRU.roundUpPool = "$" + String(NSString(format: "%.2f", rUP))
        self.roundUps?.insert(newRU, at: 0)
        
        self.collectionView.reloadData()
        
    }*/
    
    func addvToggled() {
        self.accDDView.isHidden.toggle()
    }

    // Logic used for round up
    /*func customLogic(amount: Double) -> Double {
        
        let roundUp = amount.rounded(.up)
        let roundUpAdd = roundUp - amount
        
        return roundUpAdd
        
    }*/
    
    /* End */
    
    /* Collection View Cell Dependencies */
    
    func goHome() {
        
        navigationController?.popToRootViewController(animated: true)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentOffset.x/view.frame.width)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x)
        
        let index = (targetContentOffset.pointee.x/view.frame.width)
        
        scrollViewCheck(index: Int(index))
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        finBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        
    }
    
    func scrollViewCheck(index: Int) {
        
        switch index {
        case 0:
            ammountLabel.isHidden = false
            messageLabel.isHidden = false
            break
        case 1:
            ammountLabel.isHidden = true
            messageLabel.isHidden = true
            break
        case 2:
            ammountLabel.isHidden = true
            messageLabel.isHidden = true
            break
        case 3:
            ammountLabel.isHidden = true
            messageLabel.isHidden = true
            break
        default:
            ammountLabel.isHidden = false
            messageLabel.isHidden = false
            break
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var ID: String
        
        switch indexPath.row {
        case 0:
            ID = "FeedcellId"
            break
        case 1:
            ID = "OTcellId"
            break
        case 2:
            ID = "REcellId"
            break
        case 3:
            ID = "HcellId"
            break
        default:
            ID = "FeedcellId"
            break
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID, for: indexPath)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 184)
    }
    
    // Cell initialization
/*    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RUCell
        
        cell.ru = roundUps?[indexPath.item]
        
        return cell
        
    }
    
    // Number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return roundUps?.count ?? 0
        
    }
    
    // Size of cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 90)
        
    }*/

}












