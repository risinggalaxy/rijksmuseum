//
//  DetailsViewInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol DetailsViewInterface {
    var presenter: DetailsPresenterInterface? { get set }
    var headerImage: Data? { get set }
    func updateView(with object: ObjectModel)
    func displayErrorLabel(with error: String )
}
