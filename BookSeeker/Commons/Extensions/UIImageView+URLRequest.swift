//
//  UIImageView+URLRequest.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 29/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromURL(urlString: String, completion: @escaping () -> Void = {}) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL,
                                   completionHandler: { (data, _, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
                completion()
            })
        }).resume()
    }
}
