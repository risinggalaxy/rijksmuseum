//
//  ErrorHandler.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import Foundation

public enum ErrorHandler: LocalizedError, Equatable {
    case    failedToLoadURL,
            failedToParsJSON,
            failedDueToCorruptData,
            noParentViewWasFound,
            failedRequest(description: String)
    
    public var errorDescription: String? {
        switch self {
        case .failedToParsJSON: return "Failed To Load JSON, Probably Bad JSON File"
        case .failedToLoadURL: return "Failed To Load URL, Probably Bad URL Address"
        case .failedDueToCorruptData: return "Failed Due To Corrupt Data"
        case .noParentViewWasFound: return "No Parent View Was Set"
        case .failedRequest(let description): return description
        }
    }
}
