//
//  MockDetailsInteractor.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockDetailsInteractor: DetailsInteractorInterface {
    var presenter: DetailsPresenterInterface?
    var didPresentViewWithObject: Bool = false
    var object: ObjectModel? {
        didSet {
            didPresentViewWithObject = true
        }
    }
}
