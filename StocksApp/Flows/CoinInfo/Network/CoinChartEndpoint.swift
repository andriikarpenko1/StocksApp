//
//  CoinChartEndpoint.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import Foundation

struct CoinChartEndpoint: Endpoint {

    // MARK: - Properties
    
    let id: String
    let currency: String
    let days: Int
    
    // MARK: - Init
    
    init(
        id: String,
        currency: String = "usd",
        days: Int = 30
    ) {
        self.id = id
        self.currency = currency
        self.days = days
    }
    
    // MARK: - Endpoint
    
    typealias Response = CoinChartModel
    
    var path: String { "/api/v3/coins/\(id)/market_chart" }
    
    var method: HTTPMethod { .get }
    
    var queryItems: [String : String]? {
        return ["vs_currency": currency,
                "days": "\(days)"]
    }
}
