//
//  Book.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

struct Book {
    let imageUrl: String
    let name: String
    let description: String
    let url: String
    let author: String
    let price: Double
    let currency: String
    let rating: Double?
    let ratingCount: Int?
    let genres: [String]
}
