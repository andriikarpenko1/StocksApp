//
//  ChartsPageView.swift
//  Stocks
//
//  Created by Andrey Karpenko  on 11.08.2022.
//

import SwiftUI

struct ChartsPageView: View {
    
    // MARK: - Properties
    
    let viewModels: [ChartsViewModel]
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text(L10n.chartTitle)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24.0)
            TabView {
                ForEach(viewModels) {
                    ChartView(model: $0).tag($0.id).padding(.horizontal, 24.0)
                }
            }.tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        }
    }
}

struct ChartsPageView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsPageView(viewModels: [])
    }
}
