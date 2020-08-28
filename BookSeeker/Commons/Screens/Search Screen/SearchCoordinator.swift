//
//  SearchCoordinator.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

protocol SearchCoordinatorDelegate: class {
    func pressedToSearch(_ term: String)
}

final class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    let searchViewModel: SearchViewModel
    let searchViewController: SearchViewController
    init(navigationController: UINavigationController, searchViewModel: SearchViewModel) {
        self.navigationController = navigationController
        self.searchViewModel = searchViewModel
        self.searchViewController = SearchViewController(searchViewModel: searchViewModel)
        searchViewController.searchCoordinatorDelegate = self
    }
    func start() {
        searchViewController.title = "Search"
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.pushViewController(searchViewController, animated: false)
    }
}

extension SearchCoordinator: SearchCoordinatorDelegate {
    func pressedToSearch(_ term: String) {
        searchViewModel.searched(term)
        searchViewController.searchTermTableViewController.tableView.reloadData()
    }
}
