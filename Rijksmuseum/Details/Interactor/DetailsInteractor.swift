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
            guard let artObject = object else { return }
            presenter?.updateDetailsView(with: artObject)
        }
    }
}
