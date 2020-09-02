//
//  UISnapshotTest.swift
//  BookSeekerTests
//
//  Created by Victor Kreniski on 30/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import SnapshotTesting
import XCTest
@testable import BookSeeker

class UISnapshotTest: XCTestCase {
    var record: Bool!
    let userDefaultSuiteName = "XCTest UI Environemnt"
    var userDefaults: UserDefaults!
    override func setUp() {
        record = false
        continueAfterFailure = false
        UserDefaults().removeSuite(named: userDefaultSuiteName)
        userDefaults = UserDefaults(suiteName: userDefaultSuiteName)!
    }
    override func tearDown() {
        record = nil
        userDefaults = nil
    }
    func testSearchViewControllerEmpty() {
        let searchTermsViewModelController = SearchTermsViewModelController(userDefault: userDefaults)
        let bookViewModelController = BookViewModelController()
        let searchViewController = SearchViewController(
            searchViewModel: searchTermsViewModelController, bookViewModel: bookViewModelController)
        assertSnapshot(matching: searchViewController, as: .image)
    }
    func testDetailBookViewController() {
        let staticArtWork = "https://is1-ssl.mzstatic.com/image/thumb/" +
        "Publication113/v4/38/77/d2/3877d20b-95c9-af96-9ee4-aaced107fa14/source/60x60bb.jpg"
        let book = Book(imageUrl: staticArtWork, name: "Swift Book", description: "A swifty amazing book", url: "",
                        author: "Apple", price: 39.99, currency: "USD", rating: 4.5,
                        ratingCount: 331, genres: ["Creative", "Amazing", "Life"])
        let detailBookViewController = DetailedBookViewController(selectedBook: book)
        assertSnapshot(matching: detailBookViewController, as: .image)
    }
}
