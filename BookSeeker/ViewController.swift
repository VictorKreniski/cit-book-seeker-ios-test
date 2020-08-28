//
//  ViewController.swift
//  BookSeeker
//
//  Created by Teobaldo Mauro de Moura on 26/09/19.
//  Copyright © 2019 CIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let sessionProvider = URLSessionProvider()
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
