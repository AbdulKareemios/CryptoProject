//
//  CoinImageService.swift
//  CryptoProject
//
//  Created by AK on 5/12/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let filemanager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        self.getCoinImage()
    }
    
    private func getCoinImage() {
        
        if let image = filemanager.getImage(imageName: imageName, folderName: folderName) {
            self.image = image
            print("retrieved from file")
        }
        else {
            downloadCoinImage()
        }
    }
    private func downloadCoinImage() {
        
        
        print("downloading image now...")
        guard let url = URL(string: coin.image) else {return}
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({(data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion:  NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedImage) in
                guard let strongSelf = self, let downloadedImage = returnedImage else {return}
                
                strongSelf.image = downloadedImage
                strongSelf.imageSubscription?.cancel()
                strongSelf.filemanager.saveImage(image: downloadedImage, imageName: strongSelf.imageName
                                                 , folderName: strongSelf.folderName)
            })
    }
}
