//
//  SearchCoordinator.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

protocol SearchCoordinatorDelegatePressedToSearch: class {
    func pressedToSearch(_ term: String)
}
protocol SearchCoordinatorDelegateSelectedBook: class {
    func selectedIndex(_ bookIndex: Int)
}

final class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    let searchViewModel: SearchTermViewModel
    let bookViewModel: BookViewModel
    let searchViewController: SearchViewController
    init(navigationController: UINavigationController, searchViewModel: SearchTermViewModel,
         bookViewModel: BookViewModel) {
        self.navigationController = navigationController
        self.searchViewModel = searchViewModel
        self.bookViewModel = bookViewModel
        self.searchViewController = SearchViewController(searchViewModel: searchViewModel, bookViewModel: bookViewModel)
        searchViewController.searchCoordinatorDelegatePressedToSearch = self
        searchViewController.searchCoordinatorDelegateSelectedBook = self
    }
    func start() {
        searchViewController.title = "Search"
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.pushViewController(searchViewController, animated: false)
    }
}

extension SearchCoordinator: SearchCoordinatorDelegatePressedToSearch {
    func pressedToSearch(_ term: String) {
        searchViewModel.searched(term)
        searchViewController.searchTermTableViewController.tableView.reloadData()
        searchViewController.dismissKeyboard()
        bookViewModel.updateBooksBy(term: term)
    }
}

extension SearchCoordinator: SearchCoordinatorDelegateSelectedBook {
    func selectedIndex(_ bookIndex: Int) {
        let detailedBookCoordinator = DetailedBookCoordinator(
            navigationController: navigationController, bookViewModel: bookViewModel, selectedBookIndex: bookIndex)
        detailedBookCoordinator.start()
    }
}
