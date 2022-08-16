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
        
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = Colors.navigationBar()
        
        let appearence = UITabBarAppearance(barAppearance: barAppearance)
        
        tabBar.standardAppearance = appearence
        tabBar.scrollEdgeAppearance = appearence
        tabBar.tintColor = .white
        
        viewControllers = [games, playLater, profile]
    }
    
    var games: UIViewController {
        let navigation = UINavigationController()
        let viewController = GamesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        navigation.tabBarItem = .init(title: Strings.games(), image: UIImage(systemName: Strings.gamesIcon()), tag: 0)
        
        return navigation
    }
    
    var playLater: UIViewController {
        let navigation = UINavigationController()
        let viewController = PlayLaterCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        navigation.tabBarItem = .init(title: Strings.playLater(), image: UIImage(systemName: Strings.playLaterIcon()), tag: 1)
        
        return navigation
    }
    
    var profile: UIViewController {
        let navigation = UINavigationController()
        let viewController = ProfileCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        navigation.tabBarItem = .init(title: Strings.profile(), image: UIImage(systemName: Strings.profileIcon()), tag: 2)
        
        return navigation
    }
    
}

