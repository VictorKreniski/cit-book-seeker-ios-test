//
//  SearchTermViewModel.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

final class SearchTermViewModel {
    private(set) var termsUsed: [String]
    private let userDefaultStandard = UserDefaults.standard
    init() {
        termsUsed = userDefaultStandard.object(forKey: Constants.UserDefaultKeys.usedTermsKey) as? [String] ?? []
    }
    func searched(_ term: String) {
        if termsUsed.contains(term) {
            return
        }
        if termsUsed.count >= 8 {
            termsUsed.removeLast()
        }

        termsUsed.insert(term, at: 0)
        userDefaultStandard.set(termsUsed, forKey: Constants.UserDefaultKeys.usedTermsKey)
    }
}
