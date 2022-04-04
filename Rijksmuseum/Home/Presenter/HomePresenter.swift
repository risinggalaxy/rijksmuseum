//
//  HomePresenter.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class HomePresenter: HomePresenterInterface {
    
    var view: HomeViewInterface?
    var interactor: HomeInteractorInterface?
    var wireframe: HomeWireframeInterface?
    var downloadService: DownloadService?
    var numberOfArtObjects: Int?  {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.view?.collectionView.reloadData()
            }
        }
    }
    
    func objectFor( _ index: Int ) -> ObjectModel {
        guard let object = interactor?.objectFor(index) else {
            somethingWentWrong("Was not able to find the right collection")
            return dummyObjects[0]
        }
        return object
    }
    
    func imageForCell(with url: String?, completion: @escaping (Data) -> Void ) {
        guard let url = url else {
            view?.updateUISomethingWentWrong(with: ErrorHandler.failedToLoadURL.localizedDescription)
            return
        }
        downloadService = DownloadService(urlString: url)
        downloadService?.downloader(completionHandler: {[weak self] (data, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.view?.updateUISomethingWentWrong(with: error.localizedDescription)
            }
            guard let imageData = data else {
                strongSelf.view?.updateUISomethingWentWrong(with: ErrorHandler.failedDueToCorruptData.localizedDescription)
                return
            }
            completion(imageData)
        })

    }
    
    func presentDetailsView(with object: ObjectModel, on view: VIEW) {
        wireframe?.presentDetailsView(with: object, on: view)
    }
    
    func somethingWentWrong( _ error: String) {
        view?.updateUISomethingWentWrong(with: error)
    }
}
