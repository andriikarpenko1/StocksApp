//
//  SettingsView.swift
//  StocksApp
//
//  Created by Andrey Karpenko  on 10.08.2022.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    
    @State var isDarkModeEnabled: Bool = AppSettings.shared.theme == .dark
    @EnvironmentObject private var appSettings: AppSettings
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(L10n.settingsDarkMode, isOn: $isDarkModeEnabled)
                        .onChange(of: isDarkModeEnabled) { isEnabled in
                            appSettings.theme = isEnabled ? .dark : .light
                        }
                    HStack {
                        Text(L10n.settingsLanguage)
                        Spacer()
                        Picker("", selection: appSettings.$language) {
                            ForEach(AppLanguage.allCases, id: \.self) {
                                Text($0.title)
                            }
                        }.pickerStyle(.menu)
                    }
                }
            }.navigationTitle(L10n.settingsTitle)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
