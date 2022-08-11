//
//  CoinInfoModel.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import Foundation

struct CoinInfoModel: Codable {
    let id: String
    let symbol: String
    let name: String
    let hashingAlgorithm: String?
    let localization: [String: String]
    let localizedDescription: [String: String]
    let image: CoinInfoImage
    let genesisDate: String?
    let sentimentVotesUpPercentage: Double
    let sentimentVotesDownPercentage: Double
    let marketCapRank: Int
    let coingeckoRank: Int
    let coingeckoScore: Double
    let developerScore: Double
    let communityScore: Double
    let liquidityScore: Double

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case hashingAlgorithm = "hashing_algorithm"
        case localization
        case localizedDescription = "description"
        case image
        case genesisDate = "genesis_date"
        case sentimentVotesUpPercentage = "sentiment_votes_up_percentage"
        case sentimentVotesDownPercentage = "sentiment_votes_down_percentage"
        case marketCapRank = "market_cap_rank"
        case coingeckoRank = "coingecko_rank"
        case coingeckoScore = "coingecko_score"
        case developerScore = "developer_score"
        case communityScore = "community_score"
        case liquidityScore = "liquidity_score"
    }
}

struct CoinInfoImage: Codable {
    let large: String
    let small: String
}
