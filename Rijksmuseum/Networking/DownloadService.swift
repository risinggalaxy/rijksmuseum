//
//  DownloadService.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import UIKit

class DownloadService: DownloadServiceInterface {
    
    var urlSession: URLSession
    var urlString: String
    var networkManager: NetworkManager
    
    required init(urlSession: URLSession = .shared, urlString: String) {
        self.urlSession = urlSession
        self.urlString = urlString
        networkManager = NetworkManager()
    }
    
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void) {
        
        guard let url = URL(string: self.urlString) else {
            completionHandler(nil, ErrorHandler.failedToLoadURL)
            return
        }
        
        let task = urlSession.dataTask(with: url) { [self] data, _ , error in
            if let error = error {
                if networkManager.hasConnection {
                completionHandler(nil, ErrorHandler.failedRequest(description: error.localizedDescription))
                return
                } else {
                    completionHandler(nil, ErrorHandler.noInternetConnection)
                    return
                }
            }
            guard let receivedData = data else {
                completionHandler(nil, ErrorHandler.failedDueToCorruptData)
                return
            }
            completionHandler(receivedData, nil)
        }
        task.resume()
        
    }
    
}
