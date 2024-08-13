//
//  StatisticView.swift
//  CryptoProject
//
//  Created by AK on 8/10/24.
//

import SwiftUI

struct StatisticView: View {
    
    var stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, content: {
            
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            if (stat.percentagetChnage != nil)  {
                let isNegative = stat.percentagetChnage ?? 0.0
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                        .foregroundColor(isNegative > 0 ? Color.theme.greeen : Color.theme.red)
                        .rotationEffect(.degrees(isNegative > 0 ? 0.0 : 180))
                    Text(stat.percentagetChnage?.asPercentageString() ?? "")
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(Color.theme.accent)
                }
            }
        })
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        
        StatisticView(stat: dev.stat1)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
