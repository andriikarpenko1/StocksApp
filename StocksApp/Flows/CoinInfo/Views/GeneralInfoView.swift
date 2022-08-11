//
//  GeneralInfoView.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import SwiftUI
import Kingfisher

struct GeneralInfoView: View {
    
    // MARK: - Properties
    
    let viewModel: CoinGeneralInfoViewModel
    private let processor = DownsamplingImageProcessor(
        size: .init(width: 250.0, height: 250.0))
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text(L10n.coinInfoGeneralInfo)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            KFImage(viewModel.imageUrl)
                .placeholder {
                    ProgressView()
                }
                .setProcessor(processor)
                .fade(duration: 1)
                .scaledToFit()
                .frame(width: 250.0, height: 250.0)
            ForEach(viewModel.items) {
                RankGridView(title: $0.title, value: $0.value)
            }.padding(.vertical, 4.0)
        }
    }
}

struct GeneralInfoView_Previews: PreviewProvider {
    
    static let viewModel: CoinGeneralInfoViewModel = .init(
        imageUrl: URL(string: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880")!,
        items: [
            .init(title: L10n.coinInfoIdentifier, value: "ethereum"),
            .init(title: L10n.coinInfoSymbol, value: "eth"),
            .init(title: L10n.coinInfoHashingAlgorithm, value: "Ethash"),
            .init(title: L10n.coinInfoGenesisDate, value: "30.07.2022")
        ])
    
    static var previews: some View {
        GeneralInfoView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        
        GeneralInfoView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
