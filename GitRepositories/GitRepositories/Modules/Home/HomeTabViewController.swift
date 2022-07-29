//
//  HomeTabViewController.swift
//  GitRepositories
//
//  Created by Nikolas Cardoso de Oliveira on 29/07/22.
//

import Foundation
import UIKit

class HomeTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [repositories]
    }
    
    var repositories: UIViewController {
        let navigation = UINavigationController()
        let viewController = RepositoriesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        navigation.tabBarItem = .init(title: Strings.resourcesTitle(), image: UIImage(systemName: "star"), tag: 0)
        
        return navigation
    }
}
