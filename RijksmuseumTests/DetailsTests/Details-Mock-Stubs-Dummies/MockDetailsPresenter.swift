//
//  MockDetailsPresenter.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockDetailsPresenter: DetailsPresenterInterface {
    
    var interactor: DetailsInteractorInterface?
    var wireframe: DetailsWireframeInterface?
    var view: DetailsViewInterface?
    
}
