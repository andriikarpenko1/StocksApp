//
//  MarketEndpoint.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

struct MarketEndpoint: Endpoint {
    
    // MARK: - Properties
    
    let currency: String
    let includesSparkline: Bool
    let order: String
    let pageSize: Int
    let pageNumber: Int
    
    // MARK: - Init
    
    init(
        currency: String,
        includesSparkline: Bool,
        order: String = "market_cap_desc",
        pageSize: Int = 100,
        pageNumber: Int = 1
    ) {
        self.currency = currency
        self.includesSparkline = includesSparkline
        self.order = order
        self.pageSize = pageSize
        self.pageNumber = pageNumber
    }
    
    // MARK: - Endpoint
        
    typealias Response = [CoinModel]
    
    var path: String { "/api/v3/coins/markets" }
    
    var method: HTTPMethod { .get }
    
    var queryItems: [String : String]? {
        return ["vs_currency": currency,
                "order": order,
                "per_page": "\(pageSize)",
                "page": "\(pageNumber)",
                "sparkline": "\(includesSparkline)"
        ]
    }
}

