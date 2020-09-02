//
//  ITunesBookService.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

enum ItunesBookService: ServiceProtocol {
    case eBookSearch(term: String)
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com/")!
    }
    var path: String {
        switch self {
        case .eBookSearch:
            return "search"
        }
    }
    var method: HTTPMethod {
        return .get
    }
    var task: Task {
        switch self {
        case .eBookSearch(let term):
            return .requestParameters(["term": "\(term)", "media": "ebook"])
        }
    }
    var headers: Headers? {
        return ["Content-Type": "application/json"]
    }
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
