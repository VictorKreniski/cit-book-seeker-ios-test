//
//  URLRequest+ServiceProtocol.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 28/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import Foundation

extension URLRequest {
    init(service: ServiceProtocol) {
        let urlComponents = URLComponents(service: service)
        self.init(url: urlComponents.url!)
        httpMethod = service.method.rawValue
        service.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        guard
            case let .requestParameters(parameters) = service.task,
            service.parametersEncoding == .json
            else { return }
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
}
