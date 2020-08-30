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
    let searchViewModel = SearchTermViewModel()
    let bookViewModel = BookViewModel()
    let searchCoordinator: SearchCoordinator
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.hideKeyboardWhenTappedAround()
        self.searchCoordinator = SearchCoordinator(
            navigationController: navigationController, searchViewModel: searchViewModel, bookViewModel: bookViewModel)
    }
    func start() {
        searchCoordinator.start()
    }
}
