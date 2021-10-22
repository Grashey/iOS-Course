//
//  TabBarController.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 09.10.2021.
//

import UIKit

class TabBarController: UITabBarController {

    let movieNavigation = UINavigationController()
    let entityNavigation = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        movieNavigation.tabBarItem = UITabBarItem(title: "Movies", image: nil, selectedImage: nil)
        entityNavigation.tabBarItem = UITabBarItem(title: "Universe", image: nil, selectedImage: nil)
        
        viewControllers = [movieNavigation, entityNavigation]
    }

}
