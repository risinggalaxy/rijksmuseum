//
//  DetailsInteractor.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class DetailsInteractor: DetailsInteractorInterface {
    
    var presenter: DetailsPresenterInterface?
    
    var object: ObjectModel? {
        didSet {
            guard let artObject = object else {
                presenter?.displayErrorLabel(with: ErrorHandler.failedToParsJSON.localizedDescription)
                print("Hello")
                return
            }
            presenter?.updateDetailsView(with: artObject)
        }
    }
    
}
