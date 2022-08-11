//
//  CoinInfoEndpoint.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import Foundation

struct CoinInfoEndpoint: Endpoint {
    
    // MARK: - Properties
    
    let id: String
    let localization: Bool
    let tickers: Bool
    let marketData: Bool
    let communityData: Bool
    let developerData: Bool
    let sparkline: Bool
    
    // MARK: - Init
    
    init(
        id: String,
        localization: Bool = true,
        tickers: Bool = false,
        marketData: Bool = false,
        communityData: Bool = false,
        developerData: Bool = false,
        sparkline: Bool = true
    ) {
        self.id = id
        self.localization = localization
        self.tickers = tickers
        self.marketData = marketData
        self.communityData = communityData
        self.developerData = developerData
        self.sparkline = sparkline
    }
    
    // MARK: - Endpoint
    
    typealias Response = CoinInfoModel
    
    var path: String { "/api/v3/coins/\(id)" }
    
    var method: HTTPMethod { .get }
    
    var queryItems: [String : String]? {
        return ["localization": "\(localization)",
                "tickers": "\(tickers)",
                "market_data": "\(marketData)",
                "community_data": "\(communityData)",
                "developer_data": "\(developerData)",
                "sparkline": "\(sparkline)"]
    }
}
