//
//  ContentView.swift
//  CryptoProject
//
//  Created by Abdul Kareem on 5/4/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var  showPortfolio: Bool = false
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            //Content Layer
            VStack {
                
                homeHeaderView
                Spacer(minLength: 0)
            }
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        
    }
}


extension HomeView {
    
    private var homeHeaderView: some View {
        
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: false)
                .background(
                CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Latest Prices")
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0), anchor: .center)
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
                
        }
        .padding(.horizontal)
    }
}
