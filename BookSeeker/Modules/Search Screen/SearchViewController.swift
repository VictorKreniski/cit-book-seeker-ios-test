//
//  SearchViewController.swift
//  BookSeeker
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//

import UIKit

protocol SearchViewControllerDelegateSelectedTerm: class {
    func search(_ term: String)
}
protocol SearchViewControllerDelegateSelectedBook: class {
    func selectedIndex(_ bookIndex: Int)
}

final class SearchViewController: UIViewController, Drawable {
    let searchTermTableViewController: SearchTermTableViewController
    let listBooksTableViewController: ListBooksTableViewController
    let searchViewModel: SearchTermsViewModelController
    let searchBar: UISearchBar = UISearchBar()
    weak var searchCoordinatorDelegatePressedToSearch: SearchCoordinatorDelegatePressedToSearch?
    weak var searchCoordinatorDelegateSelectedBook: SearchCoordinatorDelegateSelectedBook?
    var currentSearchText: String = ""
    var isShowingBooksResult = false {
        didSet {
            updateUIState()
        }
    }
    init(searchViewModel: SearchTermsViewModelController, bookViewModel: BookViewModelController) {
        self.searchViewModel = searchViewModel
        self.searchTermTableViewController = SearchTermTableViewController(searchViewModel: searchViewModel)
        self.listBooksTableViewController = ListBooksTableViewController(bookViewModel: bookViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        let view = UIView(frame: UIScreen.main.bounds)
        self.view = view
        draw()
    }
    func setupSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.delegate = self
    }
    func buildViewHierarchy() {
        self.view.addSubview(searchBar)
        self.view.addSubview(searchTermTableViewController.view)
        self.view.addSubview(listBooksTableViewController.view)
    }
    func stylizeView() {
        view.backgroundColor = Constants.Design.primaryPink
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.roundCorners(corners: [.allCorners], radius: 8)
        searchBar.layer.shadowRadius = 8
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    func makeConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                           constant: 15).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -15).isActive = true
        searchTermTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        searchTermTableViewController.view.topAnchor.constraint(equalTo: searchBar.bottomAnchor,
                                                  constant: 5 ).isActive = true
        searchTermTableViewController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                   constant: 15).isActive = true
        searchTermTableViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        searchTermTableViewController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                                    constant: -15).isActive = true
        listBooksTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        listBooksTableViewController.view.topAnchor.constraint(equalTo: searchBar.bottomAnchor,
                                                  constant: 5 ).isActive = true
        listBooksTableViewController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                   constant: 15).isActive = true
        listBooksTableViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        listBooksTableViewController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                                    constant: -15).isActive = true
    }
    func setupAdditionalConfigurations() {
        self.searchTermTableViewController.searchViewControllerDelegateSelectedTerm = self
        self.listBooksTableViewController.searchViewControlerDelegateSelectedBook = self
        setupSearchBar()
        listBooksTableViewController.view.alpha = 0
    }
    func updateUIState() {
        UIView.animate(withDuration: 0.3, animations: {
            if self.isShowingBooksResult {
                self.listBooksTableViewController.view.alpha = 1
                self.searchTermTableViewController.view.alpha = 0
            } else {
                self.listBooksTableViewController.view.alpha = 0
                self.searchTermTableViewController.view.alpha = 1
            }
        })
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearchText = searchText
        if currentSearchText.isEmpty {
            isShowingBooksResult = false
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchCoordinatorDelegatePressedToSearch?.pressedToSearch(currentSearchText)
        isShowingBooksResult = true
    }
}

extension SearchViewController: SearchViewControllerDelegateSelectedTerm {
    func search(_ term: String) {
        isShowingBooksResult = true
        currentSearchText = term
        searchBar.text = term
        searchCoordinatorDelegatePressedToSearch?.pressedToSearch(currentSearchText)
    }
}

extension SearchViewController: SearchViewControllerDelegateSelectedBook {
    func selectedIndex(_ bookIndex: Int) {
        searchCoordinatorDelegateSelectedBook?.selectedIndex(bookIndex)
    }
}
