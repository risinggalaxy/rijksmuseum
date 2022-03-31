//
//  Constants.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 29/03/2022.
//

import Foundation

struct APIURL {
    static let urlComponent = URLComponents(string: "https://www.rijksmuseum.nl/api/\(kSearchLanguage)/collection?key=\(apiKey)&ps=\(kProductPerPage)")
    static let apiKey = "0fiuZFh4"
    public static func getURL() -> String {
        guard let str = urlComponent?.string else { return ErrorHandler.failedRequest(description: "Bad URL").localizedDescription }
        return str
    }
}

public var kProductPerPage: Int = 100
public var kSearchLanguage: String = "en"
