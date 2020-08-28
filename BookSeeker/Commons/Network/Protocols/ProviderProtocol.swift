//
//  ProviderProtocol.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

protocol ProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol,
                    completion: @escaping (NetworkResponse<T>) -> Void) where T: Decodable
}
