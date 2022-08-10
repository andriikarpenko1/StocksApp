//
//  AppSettings.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

private enum Keys {
    static let theme = "theme"
    static let language = "language"
}

class AppSettings: ObservableObject {
    
    static let shared: AppSettings = .init()
    
    // MARK: - Stored Properties
    
    @AppStorage(Keys.theme) var theme: AppTheme = .light
    @AppStorage(Keys.language) var language: AppLanguage = .english
    
    // MARK: - Init
    
    private init() {}
}
