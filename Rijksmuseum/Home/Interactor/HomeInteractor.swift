//
//  HomeInteractor.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class HomeInteractor: HomeInteractorInterface {
    
    var presenter: HomePresenterInterface?
    
    var downloadService: DownloadService? {
        didSet {
            if let downloadService = downloadService {
                downloadService.downloader {[weak self](data, error) in
                    guard let strongSelf = self else { return }
                    if let error = error {
                        strongSelf.presenter?.somethingWentWrong("Some thing went wrong with the following error : \(error)")
                    }
                    guard let receivedData = data else {
                        strongSelf.presenter?.somethingWentWrong(ErrorHandler.failedDueToCorruptData.localizedDescription)
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        let mainModel = try decoder.decode(MainModel.self, from: receivedData)
                        strongSelf.artObjects = mainModel.artObjects.shuffled()
                    } catch {
                        strongSelf.presenter?.somethingWentWrong(ErrorHandler.failedToParsJSON.localizedDescription)
                    }
                }
            }
        }
    }
    
    var artObjects: [ObjectModel]? {
        didSet {
            guard let object = artObjects else {
                presenter?.somethingWentWrong("Was not able to find objects")
                return
            }
            if object.count > 1 {
                presenter?.numberOfArtObjects = object.count
            } else {
                presenter?.somethingWentWrong("Empty collection")
            }
        }
    }
    
    func objectFor(_ index: Int) -> ObjectModel {
        let object = artObjects?[index] != nil ? artObjects![index] : dummyObjects[index]
        return object
    }
    
}
