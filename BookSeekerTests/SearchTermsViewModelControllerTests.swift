//
//  SearchTermsViewModelControllerTests.swift
//  BookSeekerTests
//
//  Created by Victor Kreniski on 30/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import XCTest
@testable import BookSeeker

class SearchTermsViewModelControllerTests: XCTestCase {
    private var userDefaults: UserDefaults!
    private let userDefaultSuiteName = "XCTest Environemnt"
    private let term = "Test Word"
    private var searchTermsViewModel: SearchTermsViewModelController!
    override func setUp() {
        UserDefaults().removeSuite(named: userDefaultSuiteName)
        userDefaults = UserDefaults(suiteName: userDefaultSuiteName)
        searchTermsViewModel = SearchTermsViewModelController(userDefault: userDefaults)
    }
    override func tearDown() {
        searchTermsViewModel = nil
    }
    func testAppendSearchedTerm() {
        searchTermsViewModel.searched(term)
         if searchTermsViewModel.termsUsed.contains(term) {
            XCTAssert(true)
        } else {
            XCTAssert(false, "SearhTermsViewModel Instance should contain searched term")
        }
    }
    func testPersistenceStore() {
        searchTermsViewModel.searched(term)
        let newSearchTermsViewModel = SearchTermsViewModelController(userDefault: userDefaults)
        if newSearchTermsViewModel.termsUsed.contains(term) {
            XCTAssert(true)
        } else {
            XCTAssert(false, "Searched Terms are not being persisted")
        }
    }
}
