//
//  CoinRowView.swift
//  CryptoProject
//
//  Created by AK on 5/8/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    var body: some View {
        
        HStack(spacing: 0) {
            leftColoumn
            Spacer()
            if showHoldingsColumn {
                centerColoumn
            }
            rightColoumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin,showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
    }
}


extension CoinRowView {
    
  private var leftColoumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
   private var centerColoumn: some View {
        
        
            VStack(alignment: .trailing){
                Text(coin.currentHoldingsValue.asCurrecnyWith2Decimals())
                    .bold()
                Text((coin.currentHoldings ?? 0).asNumberString())
            }
            .foregroundColor(Color.theme.accent)
        
    }
    
    private var rightColoumn: some View {
        
        VStack {
            Text("\(coin.currentPrice.asCurrecnyWith6Decimals())")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.greeen :
                    Color.theme.red)
                
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        
    }
}
