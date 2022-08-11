//
//  L10n.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

enum L10n {
    
    static var marketTitle: String {
        return translate(key: "market_title")
    }
    
    static var settingsTitle: String {
        return translate(key: "settings_title")
    }
    
    static var marketCoin: String {
        return translate(key: "market_coin")
    }
    
    static var marketPrice: String {
        return translate(key: "market_price")
    }
    
    static var searchBarTitle: String {
        return translate(key: "search_bar_title")
    }
    
    static var coinInfoIdentifier: String {
        return translate(key: "coin_info_identifier")
    }
    
    static var coinInfoSymbol: String {
        return translate(key: "coin_info_symbol")
    }
    
    static var coinInfoHashingAlgorithm: String {
        return translate(key: "coin_info_hashing_algorithm")
    }
    
    static var coinInfoGenesisDate: String {
        return translate(key: "coin_info_genesis_date")
    }
    
    static var coinInfoMarketCap: String {
        return translate(key: "coin_info_market_cap")
    }
    
    static var coinInfoLiquidityScore: String {
        return translate(key: "coin_info_liquidity_score")
    }
    
    static var coinInfoCoingeckoRank: String {
        return translate(key: "coin_info_coingecko_rank")
    }
    
    static var coinInfoCoingeckoScore: String {
        return translate(key: "coin_info_coingecko_score")
    }
    
    static var coinInfoDeveloperScore: String {
        return translate(key: "coin_info_developer_score")
    }
    
    static var coinInfoCommunityScore: String {
        return translate(key: "coin_info_community_score")
    }
    
    static var coinInfoAudienceScore: String {
        return translate(key: "coin_info_audience_score")
    }
    
    static var coinInfoVotesUp: String {
        return translate(key: "coin_info_votes_up")
    }
    
    static var coinInfoMarketStats: String {
        return translate(key: "coin_info_market_stats")
    }
    
    static var coinInfoDescription: String {
        return translate(key: "coin_info_description")
    }
    
    static var coinInfoGeneralInfo: String {
        return translate(key: "coin_info_general_info")
    }
    
    static var chartTitle: String {
        return translate(key: "chart_title")
    }
    
    static var chartPrice: String {
        return translate(key: "chart_price")
    }
    
    static var chartMarketCap: String {
        return translate(key: "chart_market_cap")
    }
    
    static var chartVolume: String {
        return translate(key: "chart_volume")
    }
    
    static var delete: String {
        return translate(key: "delete")
    }
    
    static var settingsDarkMode: String {
        return translate(key: "settings_dark_mode")
    }
    
    static var settingsLanguage: String {
        return translate(key: "settings_language")
    }
    
    static var settingsEnglish: String {
        return translate(key: "settings_english")
    }
    
    static var settingsUkrainian: String {
        return translate(key: "settings_ukrainian")
    }
    
    static var errorUnknown: String {
        return translate(key: "error_unknown")
    }
    
    // MARK: - Translate
    
    static func translate(table: String = "Localizable", key: String) -> String {
        guard let bundlePath = Bundle.main.path(forResource: AppSettings.shared.language.rawValue,
                                                ofType: "lproj"),
              let bundle = Bundle(path: bundlePath)
        else {
            return NSLocalizedString(key, tableName: table, comment: "")
        }
        
        return NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
    }
}
