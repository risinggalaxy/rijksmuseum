//
//  DetailsPresenter.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class DetailsPresenter: DetailsPresenterInterface {
    
    var view: DetailsViewInterface?
    var interactor: DetailsInteractorInterface?
    var wireframe: DetailsWireframeInterface?
    
    var downloadService: DownloadService?
    

    func updateDetailsView(with object: ObjectModel) {
        view?.updateView(with: object)
        updateHeaderImage(for: object.title + "_header", and: object.headerImage.url, with: .shared)
    }
    
    fileprivate func updateHeaderImage(_ imageData: Data) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.view?.headerImage = imageData
        }
    }
    
    func updateHeaderImage(for name: String, and url: String, with urlSession: URLSession) {
        if CacheService.imageExists(fileName: name, in: .cache).available {
            guard let imageData = CacheService.imageExists(fileName: name, in: .cache).imageData else {
                view?.displayErrorLabel(with: "Unable to load cached image")
                return
            }
            updateHeaderImage(imageData)
        } else {
            
            downloadService = DownloadService(urlSession: urlSession, urlString: url)
            downloadService?.downloader(completionHandler: { [weak self] (data, error) in
                guard let strongSelf = self else { return }
                if let error = error {
                    strongSelf.view?.displayErrorLabel(with: error.localizedDescription)
                    return
                }
                guard let imageData = data else {
                    strongSelf.view?.displayErrorLabel(with: ErrorHandler.failedDueToCorruptData.localizedDescription)
                    return
                }
                CacheService.saveImage(fileName: name, imageData: imageData, in: .cache)
                strongSelf.updateHeaderImage(imageData)
            })
            
        }
    }
    
    func displayErrorLabel(with error: String) {
        view?.displayErrorLabel(with: error)
    }
    
}
