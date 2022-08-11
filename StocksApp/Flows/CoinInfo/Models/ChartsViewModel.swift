//
//  ChartViewModel.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import Foundation
import SwiftUI

enum ChartInterval: Int, CaseIterable {
    case oneDay = 1
    case sevenDays = 7
    case fourteenDays = 14
    case thirtyDays = 30
    
    // TODO: - Localize
    var title: String {
        return "\(self.rawValue)d"
    }
}

struct ChartsViewModel: Identifiable {
    
    // MARK: - Properties

    let id: String
    let charts: [ChartInterval: ChartViewModel]!
    let chartIntervals: [ChartInterval] = ChartInterval.allCases
    
    // MARK: - Init
    
    init(title: String, data: [ChartTimeModel]) {
        self.id = title
        var dict: [ChartInterval: ChartViewModel] = [:]
        chartIntervals.forEach { interval in
            dict[interval] = .init(data: ChartsViewModel.createChartData(for: interval, fullData: data))
        }
        self.charts = dict
    }
}

// MARK: - Functions for initializer
private extension ChartsViewModel {
    static func createChartData(for interval: ChartInterval, fullData: [ChartTimeModel]) -> [Double] {
        switch interval {
        case .oneDay, .sevenDays, .fourteenDays:
            let startDate = getStartDate(for: interval.rawValue)
            let currentDate = Date()
            return fullData.filter { return $0.date > startDate && $0.date < currentDate }.map { $0.value }
        case .thirtyDays:
            return fullData.map { $0.value }
        }
    }
    
    static func getStartDate(for days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -days, to: Date()) ?? Date().addingTimeInterval(TimeInterval(-60*60*24*days))
    }
}
