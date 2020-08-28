//
//  SearchViewController.swift
//  BookSeeker
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    private let sessionProvider = URLSessionProvider()
    private let screen = ViewControllerScreen()
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = Constants.Design.mainColor
        view.addSubview(screen)
        self.view = view
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sessionProvider.request(type: ITunesResponse.self,
                                service: ItunesBookService.eBookSearch(term: "Swift")) { (response) in
            switch response {
            case .success(let iTunesResponseData):
                print(iTunesResponseData)
            case .failure(let networkError):
                print("error: \(networkError)")
            }
        }
    }
}

class ViewControllerScreen: UIView, Drawable {
    var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        draw()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func buildViewHierarchy() {
        addSubview(button)
    }
    func stylizeView() {
        backgroundColor = .darkGray

    }
    func makeConstraints() {
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15).isActive = true
    }
}
