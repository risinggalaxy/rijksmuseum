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
    
    var downloadService: DownloadService? {
        didSet {
            guard let dls = downloadService else {
                view?.displayErrorLabel(with: ErrorHandler.failedToLoadURL.localizedDescription)
                return
            }
            dls.downloader {[weak self] (data, error) in
                guard let strongSelf = self else { return }
                if let error = error {
                    strongSelf.view?.displayErrorLabel(with: error.localizedDescription)
                }
                guard let imageData = data else {
                    strongSelf.view?.displayErrorLabel(with: ErrorHandler.failedDueToCorruptData.localizedDescription)
                    return
                }
                strongSelf.headerImage = imageData
            }
        }
    }
    
    var headerImage: Data? {
        didSet {
            guard let imageData = headerImage else {
                view?.displayErrorLabel(with: ErrorHandler.failedDueToCorruptData.localizedDescription)
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.view?.headerImage = imageData
            }
        }
    }

    func updateDetailsView(with object: ObjectModel) {
        view?.updateView(with: object)
        
    }
    
    func displayErrorLabel(with error: String) {
        view?.displayErrorLabel(with: error)
    }
    
}
