//
//  DetailedBookCoordinator.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 29/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class DetailedBookCoordinator: Coordinator {
    var navigationController: UINavigationController
    let bookViewModel: BookViewModelController
    let selectedBookIndex: Int
    init(navigationController: UINavigationController, bookViewModel: BookViewModelController, selectedBookIndex: Int) {
        self.navigationController = navigationController
        self.bookViewModel = bookViewModel
        self.selectedBookIndex = selectedBookIndex
    }
    func start() {
        let detailedBookViewController = DetailedBookViewController(
            selectedBook: bookViewModel.books[selectedBookIndex])
        navigationController.pushViewController(detailedBookViewController, animated: true)
    }
}
