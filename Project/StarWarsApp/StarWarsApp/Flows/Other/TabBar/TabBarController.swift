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
    let favoritesNavigation = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()

        movieNavigation.tabBarItem = UITabBarItem(title: Constants.TabBarTitle.movies, image: nil, selectedImage: nil)
        entityNavigation.tabBarItem = UITabBarItem(title: Constants.TabBarTitle.universe, image: nil, selectedImage: nil)
        favoritesNavigation.tabBarItem = UITabBarItem(title: Constants.TabBarTitle.favorites, image: nil, selectedImage: nil)

        viewControllers = [movieNavigation, entityNavigation, favoritesNavigation]
    }

}
