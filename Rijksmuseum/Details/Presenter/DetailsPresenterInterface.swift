//
//  DetailsPresenterInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol DetailPresenterInterface {
    var view: DetailViewInterface? { get set }
    var interactor: DetailInteractorInterface? { get set }
    var wireframe: DetailWireframeInterface? { get set }
}
