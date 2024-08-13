//
//  MarketDataService.swift
//  CryptoProject
//
//  Created by AK on 8/13/24.


import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getMaketData()
    }
    private func getMaketData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:)) {[weak self] globalData in
                self?.marketData = globalData.data
                self?.marketDataSubscription?.cancel()
            }
    }
}
