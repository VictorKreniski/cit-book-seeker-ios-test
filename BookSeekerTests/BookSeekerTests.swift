//
//  BookViewModelControllerTests.swift
//  BookViewModelControllerTests
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//

import XCTest
@testable import BookSeeker

class BookViewModelControllerTests: XCTestCase {

    private let timeout: TimeInterval = 10.0
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestSwiftFromItunesShouldBeSuccess() {
        let sessionProvider = URLSessionProvider()
        let term = "World of Warcraft"
        let expectation = XCTestExpectation(description: "GET Request should retrieve data from iTunes API")
        sessionProvider.request(type: ITunesResponse.self,
                                service: ItunesBookService.eBookSearch(term: term)) { (response) in
            switch response {
            case let .success(iTunesResponse):
                XCTAssertNotNil(iTunesResponse)
            case let .failure(error):
                XCTFail("GET Books from iTunes failed with error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    func testRequestSwiftFromItunesShouldBeSuccess() {
        let sessionProvider = URLSessionProvider()
        let term = "World of Warcraft"
        let expectation = XCTestExpectation(description: "GET Request should retrieve data from iTunes API")
        sessionProvider.request(type: ITunesResponse.self,
                                service: ItunesBookService.eBookSearch(term: term)) { (response) in
            switch response {
            case let .success(iTunesResponse):
                XCTAssertNotNil(iTunesResponse)
            case let .failure(error):
                XCTFail("GET Books from iTunes failed with error: \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
