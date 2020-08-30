//
//  SearchTermsViewModelController.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

final class SearchTermsViewModelController {
    private(set) var termsUsed: [String]
    private let userDefault: UserDefaults
    init(userDefault: UserDefaults = UserDefaults.standard) {
        self.userDefault = userDefault
        termsUsed = userDefault.object(forKey: Constants.UserDefaultKeys.usedTermsKey) as? [String] ?? []
    }
    func searched(_ term: String) {
        if termsUsed.contains(term) {
            return
        }
        if termsUsed.count >= 8 {
            termsUsed.removeLast()
        }

        termsUsed.insert(term, at: 0)
        persistSearched(term)
    }
    private func persistSearched(_ term: String) {
        userDefault.set(termsUsed, forKey: Constants.UserDefaultKeys.usedTermsKey)
    }
}
