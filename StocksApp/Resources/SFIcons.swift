//
//  SFIcons.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

enum SFIcons {
    case marketTab
    case settingsTab
    case search
    case clear
    case delete
    
    var name: String {
        switch self {
        case .marketTab:
            return "chart.line.uptrend.xyaxis.circle"
        case .settingsTab:
            return "gear.circle.fill"
        case .search:
            return "magnifyingglass"
        case .clear:
            return "xmark.circle.fill"
        case .delete:
            return "trash"
        }
    }
    
    var image: Image {
        return Image(systemName: self.name)
    }
}
