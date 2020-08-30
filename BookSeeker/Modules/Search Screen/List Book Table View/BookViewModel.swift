//
//  BookViewModel.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

protocol BookViewModelDataUpdateNotification: class {
    func newData()
}

final class BookViewModel {
    var updateHandler: () -> Void = {}
    private(set) var books: [Book] = []
    private var sessionProvider: URLSessionProvider = URLSessionProvider()
    func updateBooksBy(term: String) {
        books.removeAll()
        self.updateHandler()
        sessionProvider.request(type: ITunesResponse.self,
                                service: ItunesBookService.eBookSearch(term: term)) { (response) in
            switch response {
            case let .success(iTunesResponse):
                self.books = iTunesResponse.results
                self.updateHandler()
            case let .failure(error):
                print(error)
            }
        }
    }
    func requestCoverImage(of book: Book, for imageView: UIImageView) {
        imageView.imageFromURL(urlString: book.imageUrl)
    }
}
