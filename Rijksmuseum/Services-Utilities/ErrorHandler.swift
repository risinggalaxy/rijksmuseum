//
//  ErrorHandler.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import Foundation

public enum ErrorHandler: LocalizedError, Equatable {
    case    failedToLoadURL,
            noInternetConnection,
            noValidImage,
            failedToParsJSON,
            failedDueToCorruptData,
            noParentViewWasFound,
            failedRequest(description: String)
    
    public var errorDescription: String? {
        switch self {
        case .failedToParsJSON: return "Failed To Load JSON \n Probably Bad JSON File"
        case .noInternetConnection: return "This Application Requires \n An Active Internet Connection "
        case .noValidImage: return "Was Not Able To Find \n The Right Image"
        case .failedToLoadURL: return "Failed To Load URL \n Probably Bad URL Address"
        case .failedDueToCorruptData: return "Failed Due To Corrupt Data"
        case .noParentViewWasFound: return "No Parent View Was Set"
        case .failedRequest(let description): return description
        }
    }
}
