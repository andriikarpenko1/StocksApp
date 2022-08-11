//
//  CoinInfoRepo.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import Foundation
import Combine

class CoinInfoRepo {
    
    // MARK: - Properties
    
    @Published var infoList: [String: CoinInfoModel] = [:]
    @Published var loadingState: LoadingState = .loaded
    
    private let network: NetworkController = .shared
    private var requestCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getCoinInfo(id: String) {
        guard infoList[id] == nil else { return }
        
        loadingState = .loading
        let endpoint: CoinInfoEndpoint = .init(id: id)
        requestCancellable = network.request(endpoint: endpoint)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.loadingState = .loaded
                case .failure(let error):
                    self?.loadingState = .error(error)
                }
            } receiveValue: { [weak self] coin in
                self?.infoList[id] = coin
            }
    }
}
