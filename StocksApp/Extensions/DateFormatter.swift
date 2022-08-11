//
//  DateFormatter.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import Foundation

extension DateFormatter {
    
    static let genesisDateFormatter: DateFormatter = {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    // TODO: - Fix name
    static var longNoneStyleDateFormatter: DateFormatter {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = .preferredLanguageLocale
        return dateFormatter
    }
}
