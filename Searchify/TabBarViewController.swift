//
//  TabBarViewController.swift
//  Searchify
//
//  Created by C McGhee on 9/7/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.cyan], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.cyan], for: .selected)
    }

}
