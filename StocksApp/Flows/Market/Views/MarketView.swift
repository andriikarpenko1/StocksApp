//
//  MarketView.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

struct MarketView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: MarketViewModel
    @State private var selectedCoinVM: CoinInfoViewModel? = nil
    @State private var shouldShowInfo: Bool = false
    @EnvironmentObject private var appSettings: AppSettings
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            coinsList.navigationTitle(L10n.marketTitle)
                .background(
                    NavigationLink(
                        destination: CoinInfoContainerView(vm: $selectedCoinVM).onDisappear(perform: { shouldShowInfo = false }),
                        isActive: $shouldShowInfo,
                        label: { EmptyView() }
                    )
                )
        }
    }
}

private extension MarketView {
    var coinsList: some View {
        VStack(spacing: 0.0) {
            SearchBarView(searchText: $viewModel.searchText)
                .padding(.init(top: 12.0, leading: 24.0, bottom: 12.0, trailing: 24.0))
            HStack {
                Text(L10n.marketCoin)
                Spacer()
                Text(L10n.marketPrice)
            }.padding(.horizontal, 24.0)
                .padding(.top, 16.0)
                .foregroundColor(Theme.description)
            List(viewModel.coinsList) { coin in
                CoinView(viewModel: coin)
                    .contentShape(Rectangle())
                    .onTapGesture { showDetail(for: coin.id, title: coin.name) }
            }
            .listStyle(.plain)
            .listRowInsets(.init(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
        }
    }
    
    private func showDetail(for id: String, title: String) {
        selectedCoinVM = .init(with: id, title: title)
        shouldShowInfo.toggle()
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MarketView(viewModel: .init()).preferredColorScheme(.dark)
        }
    }
}

