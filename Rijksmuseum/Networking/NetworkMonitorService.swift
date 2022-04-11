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
                switch path.status {
                case .satisfied: strongSelf.hasConnection = true
                    NotificationCenter.default.post(name: NSNotification.Name("Online"), object: nil)
                case .unsatisfied: strongSelf.hasConnection = false
                    NotificationCenter.default.post(name: NSNotification.Name("Offline"), object: nil)
                default: break
                }
            }
        }
        networkMonitor.start(queue: networkQueue)
    }
    
}
