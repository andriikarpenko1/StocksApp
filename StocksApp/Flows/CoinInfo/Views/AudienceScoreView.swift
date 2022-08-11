//
//  AudienceScoreView.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import SwiftUI

private enum Constants {
    static let circleSize: CGSize = .init(width: 200.0, height: 200.0)
    static let circleLineWidth: CGFloat = 10.0
}

struct AudienceScoreView: View {
    
    // MARK: - Properties
    
    let viewModel: AudienceScoreViewModel
    private let columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())]
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text(L10n.coinInfoAudienceScore)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            votesUpView
            marketStatsView
        }
    }
}

private extension AudienceScoreView {
    var votesUpView: some View {
        VStack {
            Text(L10n.coinInfoVotesUp)
                .font(.title2)
                .bold()
                .foregroundColor(Theme.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                Circle()
                    .stroke(Theme.red.opacity(0.8), lineWidth: Constants.circleLineWidth)
                    .frame(width: Constants.circleSize.width, height: Constants.circleSize.height)
                Circle()
                    .trim(from: 0.0, to: viewModel.votesUp / 100)
                    .stroke(Theme.green.opacity(0.7), lineWidth: Constants.circleLineWidth)
                    .frame(width: Constants.circleSize.width, height: Constants.circleSize.height)
                    .rotationEffect(.init(degrees: -90))
                Text(viewModel.votesUpFormatted)
            }
        }
    }
    
    var marketStatsView: some View {
        VStack {
            Text(L10n.coinInfoMarketStats)
                .font(.title2)
                .bold()
                .foregroundColor(Theme.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10.0)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 16.0,
                pinnedViews: [],
                content: {
                    ForEach(viewModel.marketStats) {
                        RankGridView(title: $0.title, value: $0.value)
                    }
                }
            )
        }
    }
}

struct AudienceScoreView_Previews: PreviewProvider {
    static let viewModel: AudienceScoreViewModel = .init(
        votesUp: 72.61,
        marketStats: [
            GridItemModel(title: L10n.coinInfoMarketCap, value: "\(2)"),
            GridItemModel(title: L10n.coinInfoLiquidityScore, value: "\(96.85)"),
            GridItemModel(title: L10n.coinInfoCoingeckoRank, value: "\(2)"),
            GridItemModel(title: L10n.coinInfoCoingeckoScore, value: "\(75.87)"),
            GridItemModel(title: L10n.coinInfoDeveloperScore, value: "\(97.43)"),
            GridItemModel(title: L10n.coinInfoCommunityScore, value: "\(58.56)")
        ])
    
    static var previews: some View {
        AudienceScoreView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        
        AudienceScoreView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

struct AudienceScoreViewModel {
    let votesUp: Double
    let marketStats: [GridItemModel]
    
    var votesUpFormatted: String {
        return NumberFormatter.percentFormatter.string(from: NSNumber(value: votesUp)) ?? "\(votesUp)%"
    }
}
