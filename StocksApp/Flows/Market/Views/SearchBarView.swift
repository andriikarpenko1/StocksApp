//
//  SearchBarView.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

struct SearchBarView: View {
    
    // MARK: - Properties
    
    @Binding var searchText: String
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(systemName: SFIcons.search.name)
            TextField(L10n.searchBarTitle, text: $searchText)
                .foregroundColor(Theme.title)
                .overlay(
                    Image(systemName: SFIcons.clear.name)
                        .padding(12.0)
                        .opacity(searchText.isEmpty ? 0 : 0.8)
                        .onTapGesture { searchText = "" },
                    alignment: .trailing)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(height: 60.0)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)

            SearchBarView(searchText: .constant("Dark Mode"))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

