//
//  DetailedBookViewController.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 29/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class DetailedBookViewController: UIViewController, Drawable {
    init(selectedBook: Book) {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        let view = UIView(frame: UIScreen.main.bounds)
        self.view = view
        draw()
    }
    func buildViewHierarchy() {
    }
    func stylizeView() {
    }
    func makeConstraints() {
    }
}
