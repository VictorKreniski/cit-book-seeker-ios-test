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
    let searchViewModel = SearchViewModel()
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.hideKeyboardWhenTappedAround()
    }
    func start() {
        let searchViewController = SearchViewController(searchViewModel: searchViewModel)
        searchViewController.title = "Search"
        print(navigationController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.pushViewController(searchViewController, animated: false)
    }
}
