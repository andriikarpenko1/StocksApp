//
//  CoinView.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI
import Kingfisher

struct CoinView: View {
    
    // MARK: - Properties
    
    let viewModel: CoinViewModel
    private let processor = DownsamplingImageProcessor(
        size: .init(width: 48.0, height: 48.0))
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            KFImage(viewModel.imageURL)
                .placeholder {
                    ZStack {
                        ProgressView()
                    }
                }
                .setProcessor(processor)
                .fade(duration: 0.25)
                .scaledToFit()
                .frame(width: 48.0, height: 48.0)
                .cornerRadius(24.0)
            
            Text(viewModel.title)
                .font(.headline)
                .foregroundColor(Theme.title)
                .padding(.leading, 12.0)
            Spacer()
            VStack(alignment: .trailing, spacing: 4.0) {
                Text(viewModel.formattedPrice)
                    .font(.system(size: 16.0).bold())
                    .foregroundColor(Theme.title)
                Text(viewModel.formattedPriceChange)
                    .foregroundColor(viewModel.priceChangeColor)
            }
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    private static let vm: CoinViewModel = .init(model: .init(id: "1", symbol: "btc", name: "Bitcoin", image: "", currentPrice: 12452.07, marketCap: nil, marketCapRank: nil, fullyDilutedValuation: nil, totalVolume: nil, high24H: nil, low24H: nil, priceChange24H: 10.873, priceChangePercentage24H: nil, marketCapChange24H: nil, marketCapChangePercentage24H: nil, circulatingSupply: nil, totalSupply: nil, maxSupply: nil, ath: nil, athChangePercentage: nil, athDate: nil, atl: nil, atlChangePercentage: nil, atlDate: nil, lastUpdated: nil, sparkline: .init(price: [])))
    
    static var previews: some View {
        Group {
            CoinView(viewModel: vm)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            CoinView(viewModel: vm)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

