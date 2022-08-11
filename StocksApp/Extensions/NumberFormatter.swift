//
//  NumberFormatter.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import Foundation

extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    static let percentFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.maximumFractionDigits = 3
        numberFormatter.multiplier = 1
        return numberFormatter
    }()
    
    static var ordinalFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        numberFormatter.locale = .preferredLanguageLocale
        return numberFormatter
    }
    
    static let decimalFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.multiplier = 1
        return numberFormatter
    }()
}
