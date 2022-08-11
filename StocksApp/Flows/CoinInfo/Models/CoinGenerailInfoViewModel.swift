//
//  CoinGenerailInfoViewModel.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import Foundation

struct CoinGeneralInfoViewModel {
    let imageUrl: URL
    let items: [GridItemModel]
}

struct GridItemModel: Identifiable {
    let id: UUID = .init()
    let title: String
    let value: String
}
