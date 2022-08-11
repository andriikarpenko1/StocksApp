//
//  FullChartModel.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import Foundation

struct ChartTimeModel: Decodable {
    let date: Date
    let value: Double
}

struct FullChartModel {
    let prices: [ChartTimeModel]
    let marketCaps: [ChartTimeModel]
    let totalVolumes: [ChartTimeModel]
    
    init(with chartModel: CoinChartModel) {
        self.prices = chartModel.prices.mapToChartTimeModel()
        self.marketCaps = chartModel.marketCaps.mapToChartTimeModel()
        self.totalVolumes = chartModel.totalVolumes.mapToChartTimeModel()
    }
}

private extension Array where Element == [Double] {
    func mapToChartTimeModel() -> [ChartTimeModel] {
        return self.map { .init(
            date: Date(timeIntervalSince1970: $0[0] / 1000),
            value: $0[1])
        }
    }
}
