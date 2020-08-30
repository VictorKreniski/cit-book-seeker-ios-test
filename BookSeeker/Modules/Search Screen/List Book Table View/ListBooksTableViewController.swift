//
//  ListBooksTableViewController.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class ListBooksTableViewController: UITableViewController, Drawable {
    let bookViewModel: BookViewModelController
    weak var searchViewControlerDelegateSelectedBook: SearchViewControllerDelegateSelectedBook?
    init(bookViewModel: BookViewModelController) {
        self.bookViewModel = bookViewModel
        super.init(style: .plain)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        draw()
    }
    func buildViewHierarchy() {}
    func makeConstraints() {}
    func stylizeView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.layer.shadowRadius = 8
        tableView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
    }
    func setupAdditionalConfigurations() {
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "bookCell")
        tableView.dataSource = self
        bookViewModel.updateHandler = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.setContentOffset(.zero, animated: true)
                self?.tableView.reloadData()
            }
        }
        bookViewModel.booksEmptyHandler = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.setContentOffset(.zero, animated: true)
                self?.tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookViewModel.books.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let genericCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        if let bookCell = genericCell as? BookTableViewCell {
            bookCell.updateWith(bookViewModel.books[indexPath.row])
            bookCell.coverImageView.image = UIImage(systemName: "globe")?
                .withTintColor(.lightGray, renderingMode: .alwaysTemplate)
            bookCell.tag = indexPath.row
            DispatchQueue.main.async {
                if bookCell.tag == indexPath.row {
                    self.bookViewModel.requestCoverImage(of: self.bookViewModel.books[indexPath.row],
                                                         for: bookCell.coverImageView)
                }
            }
            bookCell.draw()
        }
        return genericCell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
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
        searchViewControlerDelegateSelectedBook?.selectedIndex(indexPath.row)
    }
}
