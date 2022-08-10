//
//  L10n.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

enum L10n {
    
    // MARK: - Translate
    
    static func translate(table: String = "Localizable", key: String) -> String {
        return NSLocalizedString(key, tableName: table, comment: "")
    }
}
