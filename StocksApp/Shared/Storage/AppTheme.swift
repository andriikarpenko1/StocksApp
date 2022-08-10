//
//  AppTheme.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

enum AppTheme: Int {
    case light
    case dark
    
    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
