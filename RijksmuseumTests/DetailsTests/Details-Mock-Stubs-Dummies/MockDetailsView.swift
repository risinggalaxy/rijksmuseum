//
//  MockDetailsView.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockDetailsView: DetailsViewInterface {
    
    var presenter: DetailsPresenterInterface?
    var artObject: ObjectModel?
    var numberUpdateWasPushed: Int = .zero
    var didReceiveUpdateFromPresenter: Bool = false
    
    func updateView(with object: ObjectModel) {
        artObject = object
        numberUpdateWasPushed += 1
        didReceiveUpdateFromPresenter = true
    }
}
