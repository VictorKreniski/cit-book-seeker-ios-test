//
//  SearchViewController.swift
//  BookSeeker
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, Drawable, UISearchBarDelegate {
    let searchTermsTableView = UITableView(frame: .zero, style: .grouped)
    let searchViewModel: SearchViewModel
    let searchBar: UISearchBar = UISearchBar()
    init(searchViewModel: SearchViewModel) {
        self.searchViewModel = searchViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = Constants.Design.mainColor
        self.view = view
        setupSearchTableView()
        draw()
    }
    func setupSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.delegate = self
    }
    func setupSearchTableView() {
        searchTermsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "searchTermCell")
        searchTermsTableView.isScrollEnabled = false
        searchTermsTableView.dataSource = self
    }
    func buildViewHierarchy() {
        self.view.addSubview(searchBar)
        self.view.addSubview(searchTermsTableView)
    }
    func stylizeView() {
        searchBar.backgroundColor = .white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.roundCorners(corners: [.allCorners], radius: 8)
        searchBar.layer.shadowRadius = 8
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        searchTermsTableView.separatorStyle = .none
        searchTermsTableView.backgroundColor = .white
        searchTermsTableView.layer.shadowRadius = 8
        searchTermsTableView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
    }
    func makeConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                           constant: 15).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -15).isActive = true
        searchTermsTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTermsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,
                                                  constant: 5 ).isActive = true
        searchTermsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                   constant: 15).isActive = true
        searchTermsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        searchTermsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                                    constant: -15).isActive = true

    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.termsUsed.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTermCell", for: indexPath)
        cell.textLabel?.text = searchViewModel.termsUsed[indexPath.row]
        cell.textLabel?.tintColor = .black
        return cell
    }
}
