//
//  ITunesBookResponse.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

struct ITunesResponse: Codable {
    let resultCount: Int
    let results: [Book]
}
