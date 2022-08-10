//
//  L10n.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

enum L10n {
    
    static var settingsEnglish: String {
        return translate(key: "settings_english")
    }
    
    static var settingsUkrainian: String {
        return translate(key: "settings_ukrainian")
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
