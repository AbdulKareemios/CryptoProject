//
//  UserProfileView.swift
//  CryptoProject
//
//  Created by AK on 7/19/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Banner and Profile Picture
            VStack {
                LinearGradient(gradient: Gradient(colors: [Color.violetStart, Color.violetEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(height: 200)
                    .overlay(
                        VStack {
                            Image("profile_picture") // Replace with user's profile picture
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            Text("John Doe")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .offset(y: 50)
                    )
            }
            .padding(.bottom, 50)
            
            // Personal Details
            VStack(alignment: .leading, spacing: 10) {
                Text("Personal Details")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                HStack {
                    Text("Email:")
                    Spacer()
                    Text("john.doe@example.com")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("Phone:")
                    Spacer()
                    Text("+1 234 567 890")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal)
            
            // Account Details
            VStack(alignment: .leading, spacing: 10) {
                Text("Account Details")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                HStack {
                    Text("Balance:")
                    Spacer()
                    Text("$10,000.00")
                        .foregroundColor(.green)
                }
                
                Text("Cryptocurrencies:")
                
                ForEach(["Bitcoin", "Ethereum", "Ripple"], id: \.self) { crypto in
                    HStack {
                        Text(crypto)
                        Spacer()
                        Text("10 \(crypto.prefix(3))")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}

extension Color {
    static let violetStart = Color(red: 138 / 255, green: 43 / 255, blue: 226 / 255)
    static let violetEnd = Color(red: 75 / 255, green: 0 / 255, blue: 130 / 255)
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
