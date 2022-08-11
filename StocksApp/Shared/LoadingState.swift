//
//  LoadingState.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

enum LoadingState {
    case loading
    case loaded
    case error(Error)
}
