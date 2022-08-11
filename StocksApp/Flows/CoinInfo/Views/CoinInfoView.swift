//
//  CoinInfoView.swift
//  Stocks
//
//  Created by Andrey Karpenko on 11.08.2022.
//

import SwiftUI
import Kingfisher

struct CoinInfoContainerView: View {
    
    // MARK: - Properties
    
    @Binding var viewModel: CoinInfoViewModel?
    
    // MARK: - Lifecycle
    
    init(vm: Binding<CoinInfoViewModel?>) {
        self._viewModel = vm
    }
    
    // MARK: - Body
    
    var body: some View {
        if let viewModel = viewModel {
            CoinInfoView(viewModel: viewModel)
                .navigationTitle(viewModel.title)
        }
    }
}

struct CoinInfoView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: CoinInfoViewModel
    @EnvironmentObject private var appSettings: AppSettings
    
    // MARK: - Body
    
    var body: some View {
        switch viewModel.loadingState {
        case .loading:
            ProgressView()
        case .error:
            // TODO: -
            Text(L10n.errorUnknown)
        case .loaded:
            ScrollView {
                VStack {
                    VStack(spacing: 24.0) {
                        if let generalInfo = viewModel.generalInfo {
                            GeneralInfoView(viewModel: generalInfo)
                            Divider()
                        }
                        if let audienceScore = viewModel.audienceScore {
                            AudienceScoreView(viewModel: audienceScore)
                            Divider()
                        }
                    }.padding(24.0)
                    if let charts = viewModel.coinCharts {
                        ChartsPageView(viewModels: charts).frame(height: 400.0)
                        Divider().padding([.horizontal, .bottom], 24.0)
                    }
                    if let info = viewModel.info {
                        DescriptionView(info: info).padding([.horizontal, .bottom], 24.0)
                    }
                }
            }
//            .onDisappear {
//                <#code#>
//            }
        }
    }
}

struct CoinInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinInfoContainerView(vm: .constant(.init(with: "bitcoin", title: "Bitcoin")))
    }
}
