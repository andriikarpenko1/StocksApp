//
//  CoinChartRepo.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import Foundation
import Combine

class CoinChartRepo {
    
    // MARK: - Properties
    
    @Published var chartList: [String: CoinChartModel] = [:]
    @Published var loadingState: LoadingState = .loaded
    
    private let network: NetworkController = .shared
    private var requestCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getCoinChart(id: String) {
        guard chartList[id] == nil else { return }
        
        loadingState = .loading
        let endpoint: CoinChartEndpoint = .init(id: id)
        requestCancellable = network.request(endpoint: endpoint)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.loadingState = .loaded
                case .failure(let error):
                    self?.loadingState = .error(error)
                }
            } receiveValue: { [weak self] chart in
                self?.chartList[id] = chart
            }
    }
}
