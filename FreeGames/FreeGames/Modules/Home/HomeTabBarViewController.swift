//
//  HomeTabBarViewController.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 02/08/22.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [games, playLater]
        tabBar.backgroundColor = Colors.navigationBar()
    }
    
    var games: UIViewController {
        let navigation = UINavigationController()
        let viewController = GamesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        navigation.tabBarItem = .init(title: Strings.games(), image: UIImage(systemName: "star"), tag: 0)
        
        return navigation
    }
    
    var playLater: UIViewController {
        let navigation = UINavigationController()
        let viewController = PlayLaterCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        navigation.tabBarItem = .init(title: Strings.playLater(), image: UIImage(systemName: "car"), tag: 1)
        
        return navigation
    }
}

