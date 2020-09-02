//
//  Book+Codable.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

extension Book: Codable {
    fileprivate enum CodingKeys: String, CodingKey {
        case imageUrl = "artworkUrl100"
        case name = "trackName"
        case description
        case url = "trackViewUrl"
        case author = "artistName"
        case price
        case currency
        case rating = "averageUserRating"
        case ratingCount = "userRatingCount"
        case genres
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(imageUrl, forKey: .imageUrl)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(url, forKey: .url)
        try container.encode(author, forKey: .author)
        try container.encode(price, forKey: .price)
        try container.encode(currency, forKey: .currency)
        try container.encode(rating, forKey: .rating)
        try container.encode(ratingCount, forKey: .ratingCount)
        try container.encode(genres, forKey: .genres)
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        author = try values.decodeIfPresent(String.self, forKey: .author) ?? ""
        currency = try values.decodeIfPresent(String.self, forKey: .currency) ?? ""
        price = try values.decodeIfPresent(Double.self, forKey: .price) ?? 0
        rating = try values.decodeIfPresent(Double.self, forKey: .rating) ?? 0
        ratingCount = try values.decodeIfPresent(Int.self, forKey: .ratingCount) ?? 0
        genres = try values.decodeIfPresent([String].self, forKey: .genres) ?? []
    }
}
