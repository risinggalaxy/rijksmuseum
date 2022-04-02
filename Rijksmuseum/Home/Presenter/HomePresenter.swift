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
    
    func presentDetailsView(with object: ObjectModel, on view: VIEW) {
        wireframe?.presentDetailsView(with: object, on: view)
    }
    
    func somethingWentWrong( _ error: String) {
        view?.updateUISomethingWentWrong(with: error)
    }
}
