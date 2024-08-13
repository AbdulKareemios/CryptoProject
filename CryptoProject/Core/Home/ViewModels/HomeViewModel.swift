//
//  HomeViewModel.swift
//  CryptoProject
//
//  Created by AK on 5/9/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    @Published var statistics: [StatisticModel] = []
    
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
   private func addSubscribers() {

        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink {[weak self] filteredCoins in
                self?.allCoins = filteredCoins
            }
            .store(in: &cancellables)
       
       marketDataService.$marketData
           .map(mapGlobalMarketData)
           .sink { [weak self] stats in
               self?.statistics = stats
           }
           .store(in: &cancellables)
           
       
    }
    
    private func filterCoins(searchText: String, coins: [CoinModel]) -> [CoinModel] {
        
        
        guard !searchText.isEmpty else {
            return coins
        }
        let lowertext = searchText.lowercased()
        return  coins.filter{ (coin) -> Bool in
            return coin.name.lowercased().contains(lowertext) ||
            coin.id.lowercased().contains(lowertext) ||
            coin.symbol.lowercased().contains(lowertext)
            }
    }
    
    private func mapGlobalMarketData(marketData: MarketDataModel?) -> [StatisticModel]{
        
        
            var stats: [StatisticModel] = []
            
            guard let data = marketData else {
                return stats
            }
            let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentagetChnage: data.marketCapChangePercentage24HUsd)
            let volume = StatisticModel(title: "Volume", value: data.volume)
            let btcDominance = StatisticModel(title: "BTC Dominannce", value: data.btcDominance)
            let portfolio = StatisticModel(title: "Portfolio", value:"$0", percentagetChnage: 0)
            stats.append(contentsOf: [
                marketCap,
                volume,
                btcDominance,
                portfolio
            ])
            return stats
        
        
    }
}
