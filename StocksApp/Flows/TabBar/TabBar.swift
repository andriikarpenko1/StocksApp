//
//  TabBar.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appSettings: AppSettings
    
    // MARK: - Body
    
    var body: some View {
        TabView {
            
        }.preferredColorScheme(appSettings.theme.colorScheme)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
