//
//  MockDetailsPresenter.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockDetailsPresenter: DetailsPresenterInterface {
    
    var downloadService: DownloadService?
    var headerImage: Data?
    var interactor: DetailsInteractorInterface?
    var wireframe: DetailsWireframeInterface?
    var view: DetailsViewInterface?
    var didReceiveUpdateFromInteractor: Bool = false
    var numberOfTimesArtObjectWasReceivedFromInteractor: Int = 0
    var artObject: ObjectModel?
    
    func updateDetailsView(with object: ObjectModel) {
        didReceiveUpdateFromInteractor = true
        numberOfTimesArtObjectWasReceivedFromInteractor += 1
        artObject = object
    }
    
    func displayErrorLabel(with error: String) {
    }
    
    
}
