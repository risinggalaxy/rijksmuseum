//
//  ObjectModels.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 29/03/2022.
//

import Foundation

struct MainModel: Codable { let artObjects: [ObjectModel] }

struct ObjectModel: Codable {
    let id: String
    let objectNumber: String
    let title: String
    let longTitle: String
    let hasImage: Bool
    let principalOrFirstMaker: String
    let showImage: Bool
    let webImage: WebImageModel
    let headerImage: HeaderImageModel
}

struct WebImageModel: Codable { let url: String }
struct HeaderImageModel: Codable { let url: String }


