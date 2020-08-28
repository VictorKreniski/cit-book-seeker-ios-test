//
//  SearchTermTableViewController.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class SearchTermTableViewController: UITableViewController {
    let searchViewModel: SearchViewModel
    weak var searchViewControllerDelegate: SearchViewControllerDelegate?
    init(searchViewModel: SearchViewModel) {
        self.searchViewModel = searchViewModel
        super.init(style: .plain)
    }
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "searchTermCell")
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.layer.shadowRadius = 8
        tableView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.termsUsed.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTermCell", for: indexPath)
        cell.textLabel?.text = searchViewModel.termsUsed[indexPath.row]
        cell.textLabel?.tintColor = .black
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "SEARCH HISTORY"
        }
        return nil
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.font = UIFont.systemFont(ofSize: 12.0)
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchViewControllerDelegate?.search(searchViewModel.termsUsed[indexPath.row])
    }
}
