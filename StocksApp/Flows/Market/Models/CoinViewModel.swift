//
//  CoinViewModel.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

struct CoinViewModel: Identifiable {
    let id: String
    let symbol: String
    let name: String
    let imageURL: URL?
    let currentPrice: Double
    let priceChange24H: Double
    
    init(model: CoinModel) {
        self.id = model.id
        self.symbol = model.symbol
        self.name = model.name
        self.imageURL = URL(string: model.image)
        self.currentPrice = model.currentPrice
        self.priceChange24H = model.priceChange24H
    }
    
    var priceChangeColor: Color {
        if priceChange24H > 0 {
            return Theme.green
        } else {
            return Theme.red
        }
    }
    
    var title: String {
        return "\(name) (\(symbol.uppercased()))"
    }
    
    var formattedPrice: String {
        return NumberFormatter.currencyFormatter.string(from: NSNumber(value: currentPrice)) ?? "\(currentPrice)"
    }
    
    var formattedPriceChange: String {
        let basePrice = currentPrice - priceChange24H
        let priceChangePercentage = (priceChange24H / basePrice) * 100
        return NumberFormatter.percentFormatter.string(from: NSNumber(value: priceChangePercentage)) ?? "\(priceChangePercentage)%"
    }
}

