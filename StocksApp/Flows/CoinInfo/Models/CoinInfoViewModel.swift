//
//  CoinInfoViewModel.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import Foundation
import Combine

class CoinInfoViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let title: String
    @Published var generalInfo: CoinGeneralInfoViewModel? = nil
    @Published var audienceScore: AudienceScoreViewModel? = nil
    @Published var coinCharts: [ChartsViewModel]? = nil
    @Published var info: String? = nil
    @Published var loadingState: LoadingState = .loaded
    
    private let coinIdentifier: String
    private let coinInfoRepo: CoinInfoRepo
    private let coinChartRepo: CoinChartRepo
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Lifecycle
    
    init(
        with id: String,
        title: String,
        coinInfoRepo: CoinInfoRepo = ReposController.shared.coinInfoRepo,
        coinChartRepo: CoinChartRepo = ReposController.shared.coinChartRepo
    ) {
        self.coinIdentifier = id
        self.title = title
        self.coinInfoRepo = coinInfoRepo
        self.coinChartRepo = coinChartRepo
        
        subscribeForCoinInfo()
        subscribeForCoinCharts()
        subscribeForLoadingState()
        getCoinInfo(id: id)
        getCoinChart(id: id)
    }
    
    // MARK: - Methods
    
    func getCoinInfo(id: String) {
        coinInfoRepo.getCoinInfo(id: id)
    }
    
    func getCoinChart(id: String) {
        coinChartRepo.getCoinChart(id: id)
    }
}

// MARK: - Private methods

private extension CoinInfoViewModel {
    func subscribeForCoinInfo() {
        coinInfoRepo.$infoList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] coinInfo in
                self?.createCoinInfoModels(model: coinInfo)
            }.store(in: &subscriptions)
    }
    
    func subscribeForCoinCharts() {
        coinChartRepo.$chartList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] charts in
                self?.createCharts(model: charts)
            }.store(in: &subscriptions)
    }
    
    func subscribeForLoadingState() {
        coinInfoRepo.$loadingState
            .combineLatest(coinChartRepo.$loadingState)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] infoState, chartState in
                switch (infoState, chartState) {
                case (.loaded, .loaded):
                    self?.loadingState = .loaded
                case (.error(let error), _), (_, .error(let error)):
                    self?.loadingState = .error(error)
                default:
                    self?.loadingState = .loading
                }
            }.store(in: &subscriptions)
    }
    
    func createCoinInfoModels(model: [String: CoinInfoModel]) {
        guard let coinInfo = model[coinIdentifier] else { return }
        
        if let imageUrl = URL(string: coinInfo.image.large) {
            var items: [GridItemModel] = []
            items.append(.init(title: L10n.coinInfoIdentifier, value: coinInfo.id))
            items.append(.init(title: L10n.coinInfoSymbol, value: coinInfo.symbol))
            if let hashingAlgorithm = coinInfo.hashingAlgorithm {
                items.append(.init(title: L10n.coinInfoHashingAlgorithm, value: hashingAlgorithm))
            }
            if let genesisDate = coinInfo.genesisDate,
               let date = DateFormatter.genesisDateFormatter.date(from: genesisDate) {
                let formattedDate = DateFormatter.longNoneStyleDateFormatter.string(from: date)
                items.append(.init(title: L10n.coinInfoGenesisDate, value: formattedDate))
            }
            generalInfo = .init(imageUrl: imageUrl, items: items)
        }
        
        audienceScore = .init(
            votesUp: coinInfo.sentimentVotesUpPercentage,
            marketStats: [
                GridItemModel(
                    title: L10n.coinInfoMarketCap,
                    value: NumberFormatter.ordinalFormatter.string(from: NSNumber(value: coinInfo.marketCapRank)) ?? ""),
                GridItemModel(
                    title: L10n.coinInfoLiquidityScore,
                    value: NumberFormatter.decimalFormatter.string(from: NSNumber(value: coinInfo.liquidityScore)) ?? ""),
                GridItemModel(
                    title: L10n.coinInfoCoingeckoRank,
                    value: NumberFormatter.ordinalFormatter.string(from: NSNumber(value: coinInfo.coingeckoRank)) ?? ""),
                GridItemModel(
                    title: L10n.coinInfoCoingeckoScore,
                    value: NumberFormatter.decimalFormatter.string(from: NSNumber(value: coinInfo.coingeckoScore)) ?? ""),
                GridItemModel(
                    title: L10n.coinInfoDeveloperScore,
                    value: NumberFormatter.decimalFormatter.string(from: NSNumber(value: coinInfo.developerScore)) ?? ""),
                GridItemModel(
                    title: L10n.coinInfoCommunityScore,
                    value: NumberFormatter.decimalFormatter.string(from: NSNumber(value: coinInfo.communityScore)) ?? "")
            ])
        
        if let info = coinInfo.localizedDescription["en"], !info.isEmpty {
            self.info = info
        }
    }
    
    func createCharts(model: [String: CoinChartModel]) {
        guard let chartsModel = model[coinIdentifier] else { return }
        let fullChartModel = FullChartModel(with: chartsModel)
        
        var charts: [ChartsViewModel] = []
        charts.append(.init(
            title: L10n.chartPrice,
            data: fullChartModel.prices
        ))
        charts.append(.init(
            title: L10n.coinInfoMarketCap,
            data: fullChartModel.marketCaps
        ))
        charts.append(.init(
            title: L10n.chartVolume,
            data: fullChartModel.totalVolumes
        ))
        coinCharts = charts
    }
}
