//
//  HomeInteractor.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class HomeInteractor: HomeInteractorInterface {
    
    var presenter: HomePresenterInterface?
    
    var artObject: [ObjectModel]? {
        didSet {
            guard let object = artObject else {
                presenter?.somethingWentWrong()
                return
            }
            if object.count > 1 {
                presenter?.numberOfArtObjects = object.count
            } else {
                presenter?.somethingWentWrong()
            }
        }
    }
    
    func objectFor(_ index: Int) -> ObjectModel {
        let object = dummyObjects[index]
        return object
    }
    
}
