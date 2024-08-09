//
//  SettingsView.swift
//  CryptoProject
//
//  Created by AK on 7/19/24.
//

import SwiftUI

import SwiftUI

struct SettingsView: View {
    @State private var isBiometricEnabled = false
    @State private var isNotificationsEnabled = false
    @State private var selectedCurrency = "USD"
    @State private var isDarkModeEnabled = false
    
    let currencies = ["USD", "EUR", "GBP", "JPY", "BTC", "ETH"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Security").font(.headline)) {
                    Toggle(isOn: $isBiometricEnabled) {
                        Text("Enable Biometric Authentication")
                    }
                }
                
                Section(header: Text("Notifications").font(.headline)) {
                    Toggle(isOn: $isNotificationsEnabled) {
                        Text("Enable Notifications")
                    }
                }
                
                Section(header: Text("Preferences").font(.headline)) {
                    Picker("Currency", selection: $selectedCurrency) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency).tag(currency)
                        }
                    }
                    Toggle(isOn: $isDarkModeEnabled) {
                        Text("Enable Dark Mode")
                    }
                }
                
                Section(header: Text("Account").font(.headline)) {
                    NavigationLink(destination: Text("Profile")) {
                        Text("Profile")
                    }
                    NavigationLink(destination: Text("Linked Accounts")) {
                        Text("Linked Accounts")
                    }
                    NavigationLink(destination: Text("Security Settings")) {
                        Text("Security Settings")
                    }
                }
                
                Section(header: Text("About").font(.headline)) {
                    NavigationLink(destination: Text("Terms and Conditions")) {
                        Text("Terms and Conditions")
                    }
                    NavigationLink(destination: Text("Privacy Policy")) {
                        Text("Privacy Policy")
                    }
                    NavigationLink(destination: Text("App Version: 1.0.0")) {
                        Text("App Version: 1.0.0")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Settings", displayMode: .large)
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
