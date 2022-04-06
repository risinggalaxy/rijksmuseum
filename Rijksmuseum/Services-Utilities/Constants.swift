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

public var kProductPerPage: Int = 200
public var kSearchLanguage: String = "en"
public var kMainTitleFont: String = "Avenir Next Heavy"
public var kDetailsTitleFont: String = "Avenir Next Heavy"
public var kDetailsInfoFont: String = "Avenir Next Medium"

var dummyObjects: [ObjectModel] = [ObjectModel(id: "Test", objectNumber: "test", title: "Test Object One",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage")),
                             ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Two",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage")),
                             ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Three",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage")),
                             ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Four",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage")),
                             ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Five",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage")),
                             ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Six",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage")),
                             ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Seven",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage")),
                             ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Eight",
                                         longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                         webImage: WebImageModel(url: "webImage"),
                                         headerImage: HeaderImageModel(url: "headerImage"))]


//var dummyObjects: [ObjectModel] = []
