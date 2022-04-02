//
//  MockHomePresenter.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockHomePresenter: HomePresenterInterface {
    var numberOfArtObjects: Int?
    var view: HomeViewInterface?
    var interactor: HomeInteractorInterface?
    var wireframe: HomeWireframeInterface?
    
    var didReceivePresentDetailViewRequest: Bool = false
    var numberReceivePresentDetailViewRequest: Int = 0
    
    var artObject: ObjectModel? {
        didSet {
            didReceivePresentDetailViewRequest = true
        }
    }
    
    func objectFor(_ index: Int) -> ObjectModel {
        return dummyObjects[0]
    }
    
    func presentDetailsView(with object: ObjectModel, on view: VIEW) {
        artObject = object
        numberReceivePresentDetailViewRequest += 1
    }
    
    func somethingWentWrong( _ error: String) {
    }
    
}
