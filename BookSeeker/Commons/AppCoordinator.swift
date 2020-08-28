//
//  AppCoordinator.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    let searchViewModel = SearchViewModel()
    let searchCoordinator: SearchCoordinator
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.hideKeyboardWhenTappedAround()
        self.searchCoordinator = SearchCoordinator(
            navigationController: navigationController, searchViewModel: searchViewModel)
    }
    func start() {
        searchCoordinator.start()
    }
}
