//
//  CoinDataService.swift
//  CryptoProject
//
//  Created by AK on 5/11/24.
//

import Foundation
import Combine


class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    //var cancellables = Set<AnyCancellable>()
    var coinSubscription: AnyCancellable?
    init() {
        
        getCoins()
    }
    
    private func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            
            return
        }
        
        
        coinSubscription =  URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw NetworkingManager.NetworkingError.badURLResponse(url: url)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: {[weak self] coins in
                self?.allCoins = coins
                self?.coinSubscription?.cancel()
            }

        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: {[weak self] returnedCoins in
                
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
     
}
