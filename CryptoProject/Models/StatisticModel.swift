//
//  StatisticModel.swift
//  CryptoProject
//
//  Created by AK on 8/10/24.
//

import Foundation

struct StatisticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentagetChnage: Double?
    
    init(title: String, value: String, percentagetChnage: Double? = nil) {
        self.title = title
        self.value = value
        self.percentagetChnage = percentagetChnage
    }
}
