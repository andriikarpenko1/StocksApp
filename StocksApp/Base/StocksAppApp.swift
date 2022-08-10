//
//  StocksAppApp.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

@main
struct StocksAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(AppSettings.shared)
        }
    }
}
