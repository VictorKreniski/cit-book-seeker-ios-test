//
//  SearchViewController.swift
//  BookSeeker
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController, Drawable {
    let searchTermTableViewController: SearchTermTableViewController
//    let listBooksTableViewController:
    let searchViewModel: SearchViewModel
    let searchBar: UISearchBar = UISearchBar()
    weak var searchCoordinatorDelegate: SearchCoordinatorDelegate?
    var currentSearchText: String = ""
    init(searchViewModel: SearchViewModel) {
        self.searchViewModel = searchViewModel
        self.searchTermTableViewController = SearchTermTableViewController(searchViewModel: searchViewModel)
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
    }
    func stylizeView() {
        view.backgroundColor = Constants.Design.mainColor
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
    }
    func setupAdditionalConfigurations() {
        setupSearchBar()
    }
}

extension SearchViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearchText = searchText
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchCoordinatorDelegate?.pressedToSearch(currentSearchText)
    }
}
