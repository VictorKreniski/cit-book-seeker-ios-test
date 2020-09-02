//
//  BookViewModelControllerTests.swift
//  BookSeekerTests
//
//  Created by Victor Kreniski on 30/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import XCTest
@testable import BookSeeker

class BookViewModelControllerTests: XCTestCase {
    private var bookViewModelController: BookViewModelController!
    override func setUp() {
        bookViewModelController = BookViewModelController()
    }
    override func tearDown() {
        bookViewModelController = nil
    }
    func testBookViewModelControllerRequest() {
        let timeout = 5.0
        let term = "Apple"
        let expectation = XCTestExpectation(
            description: "BookViewModelController should be populated with Apple term eBooks")
        bookViewModelController.updateHandler = {
            XCTAssertGreaterThan(self.bookViewModelController.books.count, 0)
            expectation.fulfill()
        }
        bookViewModelController.updateBooksBy(term: term)
        wait(for: [expectation], timeout: timeout)
    }
    func testRequestCoverImage() {
        let imageView = UIImageView()
        let timeout = 5.0
        let staticArtWork = "https://is1-ssl.mzstatic.com/image/thumb/" +
        "Publication113/v4/38/77/d2/3877d20b-95c9-af96-9ee4-aaced107fa14/source/60x60bb.jpg"
        let expectation = XCTestExpectation(
            description: "ImageView should receive a Book Cover")
        imageView.imageFromURL(urlString: staticArtWork) {
            XCTAssertNotNil(imageView.image)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
}
