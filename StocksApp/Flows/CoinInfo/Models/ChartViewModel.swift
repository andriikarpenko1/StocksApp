//
//  ChartViewModel.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import SwiftUI

struct ChartViewModel {
    let data: [Double]
    let minValue: Double
    let midValue: Double
    let maxValue: Double
    
    init(data: [Double]) {
        self.data = data
        self.minValue = data.min() ?? 0
        self.maxValue = data.max() ?? 0
        self.midValue = (minValue + maxValue) / 2
    }
    
    var minValueFormatted: String { NumberFormatter.currencyFormatter.string(from: NSNumber(value: minValue)) ?? "" }
    var midValueFormatted: String { NumberFormatter.currencyFormatter.string(from: NSNumber(value: midValue)) ?? "" }
    var maxValueFormatted: String { NumberFormatter.currencyFormatter.string(from: NSNumber(value: maxValue)) ?? "" }
    var priceChange: Double {
        let startPrice: Double = data.first ?? 0
        let endPrice: Double = data.last ?? 0
        return endPrice - startPrice
    }
    var changePercentage: String {
        let startPrice: Double = data.first ?? 0
        let endPrice: Double = data.last ?? 0
        let difference = ((endPrice / startPrice) * 100) - 100
        return NumberFormatter.percentFormatter.string(from: NSNumber(value: difference)) ?? "\(difference)%"
    }
    var chartColor: Color { priceChange > 0 ? Theme.green : Theme.red }
}
