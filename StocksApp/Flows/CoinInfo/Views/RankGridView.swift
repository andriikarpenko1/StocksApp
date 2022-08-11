//
//  RankGridView.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import SwiftUI

struct RankGridView: View {
    
    // MARK: - Properties
    
    let title: String
    let value: String
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 6.0) {
            Text(title)
                .font(.headline)
                .bold()
                .foregroundColor(Theme.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(value)
                .font(.body)
                .foregroundColor(Theme.description)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct RankGridView_Previews: PreviewProvider {
    static var previews: some View {
        RankGridView(title: L10n.coinInfoMarketCap, value: "1st")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
        
        RankGridView(title: L10n.coinInfoMarketCap, value: "1st")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
