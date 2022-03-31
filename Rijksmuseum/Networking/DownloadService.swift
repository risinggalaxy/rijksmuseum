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
    
    required init(urlSession: URLSession = .shared, urlString: String) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void) {
        guard let url = URL(string: self.urlString) else {
            completionHandler(nil, ErrorHandler.failedToLoadURL)
            return
        }
        let task = urlSession.dataTask(with: url) { data, _ , error in
            if let _ = error {
                completionHandler(nil, ErrorHandler.failedRequest(description: "The operation couldn’t be completed \n due to an error while download request"))
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
