//
//  Drawable.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

protocol Drawable {
    func buildViewHierarchy()
    func stylizeView()
    func makeConstraints()
    func setupAdditionalConfigurations()
}

extension Drawable {
    func draw() {
        buildViewHierarchy()
        stylizeView()
        makeConstraints()
        setupAdditionalConfigurations()
    }
    func setupAdditionalConfigurations() {}
}
