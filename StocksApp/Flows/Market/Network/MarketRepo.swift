//
//  MarketRepo.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation
import Combine

class MarketRepo {
    
    // MARK: - Properties
    
    @Published var coinsList: [CoinModel] = []
    @Published var loadingState: LoadingState = .loaded
    
    private let network: NetworkController = .shared
    private var requestCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getCoins(currency: String = "usd", includesSparkline: Bool = false) {
        loadingState = .loading
        let endpoint: MarketEndpoint = .init(
            currency: currency,
            includesSparkline: includesSparkline)
        
        requestCancellable = network.request(endpoint: endpoint)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.loadingState = .loaded
                case .failure(let error):
                    self?.loadingState = .error(error)
                }
            } receiveValue: { [weak self] coins in
                self?.coinsList = coins
            }
    }
}
