//
//  MockHomePresenter.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockHomePresenter: HomePresenterInterface {
    var view: HomeViewInterface?
    var interactor: HomeInteractorInterface?
    var wireframe: HomeWireframeInterface?
}
