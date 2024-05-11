//
//  CoinImageViewModel.swift
//  CryptoProject
//
//  Created by AK on 5/12/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    private var cancellabels = Set<AnyCancellable>()
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubscriber()
        self.isLoading = true
        
    }
    
    private func addSubscriber() {
        
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: {[weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellabels)
    }
}
