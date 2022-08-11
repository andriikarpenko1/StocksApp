//
//  MarketViewModel.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import Foundation
import Combine

class MarketViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var coinsList: [CoinViewModel] = []
    @Published var loadingState: LoadingState = .loaded
    @Published var searchText: String = ""
    
    private let marketRepo: MarketRepo
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Lifecycle
    
    init(marketRepo: MarketRepo = ReposController.shared.marketRepo) {
        self.marketRepo = marketRepo
        subscribeForCoins()
        subscribeForLoadingState()
        marketRepo.getCoins()
    }
    
    // MARK: - Methods
    
    func reloadCoins() {
        marketRepo.getCoins()
    }
}

// MARK: - Private methods
private extension MarketViewModel {
    func subscribeForCoins() {
        marketRepo.$coinsList
            .receive(on: DispatchQueue.main)
            .combineLatest($searchText.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main))
            .sink { [weak self] coins, text in
                self?.coinsList = coins
                    .map { return CoinViewModel(model: $0) }
                    .searchCoins(text: text)
            }
            .store(in: &subscriptions)
    }
    
    func subscribeForLoadingState() {
        marketRepo.$loadingState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadingState in
                self?.loadingState = loadingState
            }.store(in: &subscriptions)
    }
}

private extension Array where Element == CoinViewModel {
    func searchCoins(text: String) -> [CoinViewModel] {
        guard !text.isEmpty
        else {
            return self
        }
        
        return self.filter {
            return $0.title.lowercased().contains(text.lowercased())
        }
    }
}

