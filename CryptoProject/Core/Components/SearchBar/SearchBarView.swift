//
//  SearchBarView.swift
//  CryptoProject
//
//  Created by AK on 5/17/24.
//

import SwiftUI

struct SearchBarView: View {
    
    
    @Binding var searchText: String
    @State var like: Bool = true
    
    
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ?
                                 Color.theme.secondaryText : Color.theme.accent)
            TextField("Search by name of symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.ednEditing()
                        }
                    ,alignment: .trailing
                                        
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.theme.backgroundColor)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
        .padding()
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchBarView(searchText: .constant(""))
    }
}
