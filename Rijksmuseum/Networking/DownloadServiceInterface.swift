//
//  DownloadServiceInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import Foundation

protocol DownloadServiceInterface {
    var urlSession: URLSession { get set }
    var urlString: String { get set }
    init(urlSession: URLSession, urlString: String)
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void)
}
