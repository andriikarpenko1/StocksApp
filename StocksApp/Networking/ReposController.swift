//
//  ReposController.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation

class ReposController {
    
    static let shared = ReposController()
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Repos
    
    lazy var marketRepo: MarketRepo = .init()
}
