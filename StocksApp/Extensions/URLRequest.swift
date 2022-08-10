//
//  URLRequest.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

extension URLRequest {
    mutating func setHeaders(_ headers: [String: String]) {
        headers.forEach { key, value in
            self.addValue(value, forHTTPHeaderField: key)
        }
    }
    
    mutating func setBody(params: [String: Any]?) {
        guard let params = params,
              let httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        else { return }
        
        self.httpBody = httpBody
    }
}
