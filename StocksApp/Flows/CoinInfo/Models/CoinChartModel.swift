//
//  CoinChartModel.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import Foundation

struct CoinChartModel: Codable {
    let prices: [[Double]]
    let marketCaps: [[Double]]
    let totalVolumes: [[Double]]
    
    enum CodingKeys: String, CodingKey {
        case prices
        case marketCaps = "market_caps"
        case totalVolumes = "total_volumes"
    }
}
