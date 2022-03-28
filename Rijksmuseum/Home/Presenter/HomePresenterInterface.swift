//
//  HomePresenterInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol HomePresenterInterface {
    var view: HomeViewInterface? { get set }
    var interactor: HomeInteractorInterface? { get set }
    var wireframe: HomeWireframeInterface? { get set }
}
