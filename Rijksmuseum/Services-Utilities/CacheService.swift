//
//  CacheService.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 04/04/2022.
//

import UIKit

enum Directory {
    case cache, documents
}

class CacheService {
    
    init(){}
    
    public static func getURL(for directory: Directory) -> URL {
        let searchDirectory: FileManager.SearchPathDirectory
        switch directory {
        case .cache: searchDirectory = .cachesDirectory
        case .documents: searchDirectory = .documentDirectory
        }
        guard let url = FileManager.default.urls(for: searchDirectory, in: .userDomainMask).first else {
            fatalError("Did not find directory")
        }
        return url
    }
    
    public static func clear(directory: Directory) {
        let directoryUrl = getURL(for: directory)
        do {
            let cachedFiles = try FileManager.default.contentsOfDirectory(at: directoryUrl, includingPropertiesForKeys: nil, options: [])
            for fileURL in cachedFiles {
                try FileManager.default.removeItem(at: fileURL)
            }
        } catch let error {
            fatalError("\(error)")
        }
    }
    
    public static func saveImage(fileName: String, imageData: Data, in directory: Directory) {
        let directoryUrl = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)
        let filePath = directoryUrl.path
        if !imageExists(fileName: fileName, in: directory).available {
            FileManager.default.createFile(atPath: filePath, contents: imageData, attributes: [:])
        }
    }
    
    
    public static func imageExists(fileName: String, in directory: Directory) -> (available: Bool, fileURL: URL, imageData: Data?) {
        let fileURL = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)
        let imageData = FileManager.default.contents(atPath: fileURL.path)
        return (FileManager.default.fileExists(atPath: fileURL.path), fileURL, imageData)
    }
    
}
