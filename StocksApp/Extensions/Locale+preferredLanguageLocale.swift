//
//  Locale+preferredLanguageLocale.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import Foundation

extension Locale {
    static var preferredLanguageLocale: Locale {
        return Locale(identifier: AppSettings.shared.language.localeIdentifier)
    }
}
