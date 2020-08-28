//
//  AppCoordinator.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let searchViewController = ViewController()
        print(navigationController)
        navigationController.pushViewController(searchViewController, animated: false)
    }
}
