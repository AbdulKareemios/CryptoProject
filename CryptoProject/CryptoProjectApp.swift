//
//  CryptoProjectApp.swift
//  CryptoProject
//
//  Created by AK on 5/4/24.
//

import SwiftUI

@main
struct CryptoProjectApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
