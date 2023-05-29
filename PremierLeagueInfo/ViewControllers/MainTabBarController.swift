//
//  MainTabBarController.swift
//  PremierLeagueInfo
//
//  Created by Djaka Permana on 29/05/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    let mainViewController = MainViewController()
    let profileViewController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        mainViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        profileViewController.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "person"), tag: 1)
        profileViewController.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        viewControllers = [mainViewController, profileViewController]
        
        self.tabBar.tintColor = UIColor(hex: "#401152")
        self.tabBar.unselectedItemTintColor = UIColor(hex: "#71587c")
        self.tabBar.backgroundColor = UIColor(hex: "#eff0f0")
    }

}
