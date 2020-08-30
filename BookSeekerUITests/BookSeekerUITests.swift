//
//  BookSeekerUITests.swift
//  BookSeekerUITests
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//
import XCTest
@testable import BookSeeker

class BookSeekerUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation -
        // required for your tests before they run.
        // The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
//    func testSearchViewController() {
//        record = true
//        let userDefaultSuiteName = "XCTest UI Environemnt"
//        UserDefaults().removeSuite(named: userDefaultSuiteName)
//        let userDefaults: UserDefaults = UserDefaults(suiteName: userDefaultSuiteName)!
//        let searchTermsViewModelController = SearchTermsViewModelController(userDefault: userDefaults)
//        let bookViewModelController = BookViewModelController()
//        let searchViewController = SearchViewController(
//            searchViewModel: searchTermsViewModelController, bookViewModel: bookViewModelController)
//        FBSnapshotVerifyViewController(searchViewController)
//    }
//    func testDetailBookViewController() {
//        record = true
//        let staticArtWork = "https://is1-ssl.mzstatic.com/image/thumb/" +
//        "Publication113/v4/38/77/d2/3877d20b-95c9-af96-9ee4-aaced107fa14/source/60x60bb.jpg"
//        let book = Book(imageUrl: staticArtWork, name: "Swift Book", description: "A swifty amazing book", url: "",
//                        author: "Apple", price: 39.99, currency: "USD", rating: 4.5,
//                        ratingCount: 331, genres: ["Creative", "Amazing", "Life"])
//        let detailBookViewController = DetailedBookViewController(selectedBook: book)
//        FBSnapshotVerifyViewController(detailBookViewController)
//    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
