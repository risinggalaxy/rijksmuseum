//
//  NetworkMonitorService.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 06/04/2022.
//

import Network
import Foundation

class NetworkManager {
    
    let networkMonitor = NWPathMonitor()
    private static var status: NWPath.Status = .requiresConnection
    let networkQueue = DispatchQueue(label: "NetworkMonitor")
    var hasConnection: Bool = { return status == .satisfied ? true : false }()
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                if path.status == .satisfied {
                    strongSelf.hasConnection = true
                } else {
                    strongSelf.hasConnection = false
                }
            }
        }
        networkMonitor.start(queue: networkQueue)
    }
    
}
