//
//  AppLanguage.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

enum AppLanguage: String, CaseIterable {
    case english = "en"
    case ukrainian = "uk"
    
    var title: String {
        switch self {
        case .english:
            return L10n.settingsEnglish
        case .ukrainian:
            return L10n.settingsUkrainian
        }
    }
    
    var localeIdentifier: String {
        switch self {
        case .english:
            return "en-us"
        case .ukrainian:
            return "uk"
        }
    }
}
