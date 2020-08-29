//
//  SearchViewModel.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

final class SearchViewModel {
    private(set) var termsUsed: [String] = []
    func searched(_ term: String) {
        if termsUsed.contains(term) {
            return
        }
        if termsUsed.count >= 8 {
            termsUsed.removeFirst()
        }

        termsUsed.append(term)
    }
}
