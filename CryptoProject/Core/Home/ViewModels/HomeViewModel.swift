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
    
    private let dataService = CoinDataService()
    
    private var cancellables = Set<AnyCancellable>()
    init() {
        addSubscribers()
    }
    
   private func addSubscribers() {

        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink {[weak self] filteredCoins in
                self?.allCoins = filteredCoins
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
}
