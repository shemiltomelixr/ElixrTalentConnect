//
//  TabBarViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 23/01/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //calling the function containing necceesaary design details.
        designTab()
    }
    
    /// Design for the tabbar.
    func designTab(){
        //Hide the backbutton
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.clipsToBounds = true
    }
}
