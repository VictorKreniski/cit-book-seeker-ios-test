//
//  ListBooksTableViewController.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class ListBooksTableViewController: UITableViewController {
    let bookViewModel: BookViewModel
    init(bookViewModel: BookViewModel) {
        self.bookViewModel = bookViewModel
        super.init(style: .plain)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "bookCell")
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.layer.shadowRadius = 8
        tableView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
        bookViewModel.updateHandler = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookViewModel.books.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        cell.textLabel?.text = bookViewModel.books[indexPath.row].name
        cell.textLabel?.tintColor = .black
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "RESULTS \(bookViewModel.books.count)"
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
    }
}