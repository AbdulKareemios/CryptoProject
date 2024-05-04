//
//  ContentView.swift
//  CryptoProject
//
//  Created by Abdul Kareem on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .foregroundColor(Color.theme.red)
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
