//
//  WalletView.swift
//  CryptoProject
//
//  Created by AK on 7/19/24.
//

import SwiftUI

struct WalletView: View {
        var body: some View {
            VStack(alignment: .leading) {
                // Top Bar with Profile and Settings Buttons
                HStack {
                    Button(action: {
                        // Profile button action
                    }) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        // Settings button action
                    }) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .background(Color.violet)
                
                // Wallet Cards Horizontal Scroll
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<5) { index in
                            WalletCardView(cardNumber: "**** **** **** 123\(index)", cardHolder: "John Doe", expiryDate: "12/2\(index)")
                        }
                    }
                    .padding()
                }
                
                // Transactions List
                Text("Recent Transactions")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<10) { index in
                            TransactionView(transactionTitle: "Transaction \(index + 1)", transactionDate: "2024-07-0\(index + 1)", transactionAmount: "$\(Double(index + 1) * 10.0)")
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.top)
        }
    }

    struct WalletCardView: View {
        let cardNumber: String
        let cardHolder: String
        let expiryDate: String
        
        @State private var isFlipped = false
        
        var body: some View {
            ZStack {
                VStack(alignment: .leading) {
                    Text("Debit Card")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text(cardNumber)
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        Text("Card Holder")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Spacer()
                        Text("Expiry Date")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    HStack {
                        Text(cardHolder)
                            .font(.body)
                            .foregroundColor(.white)
                        Spacer()
                        Text(expiryDate)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .frame(width: 300, height: 180)
                .background(Color.violet)
                .cornerRadius(20)
                .shadow(radius: 10)
                .opacity(isFlipped ? 0 : 1)
                
                VStack(alignment: .leading) {
                    Text("Back of Card")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("CVV: 123")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .frame(width: 300, height: 180)
                .background(Color.gray)
                .cornerRadius(20)
                .shadow(radius: 10)
                .opacity(isFlipped ? 1 : 0)
            }
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .onTapGesture {
                withAnimation {
                    isFlipped.toggle()
                }
            }
        }
    }

    struct TransactionView: View {
        let transactionTitle: String
        let transactionDate: String
        let transactionAmount: String
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(transactionTitle)
                        .font(.headline)
                    Text(transactionDate)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text(transactionAmount)
                    .font(.headline)
                    .foregroundColor(.green)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }

    extension Color {
        static let violet = Color(red: 138 / 255, green: 43 / 255, blue: 226 / 255)
    }

    struct WalletView_Previews: PreviewProvider {
        static var previews: some View {
            WalletView()
        }
    }
