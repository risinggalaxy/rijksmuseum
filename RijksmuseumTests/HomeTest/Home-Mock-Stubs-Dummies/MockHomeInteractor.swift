//
//  Mock.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockHomeInteractor: HomeInteractorInterface {

    var presenter: HomePresenterInterface?
    var didReturnObject: Bool = false
    var artObject: [ObjectModel]?
    
    func objectFor( _ index: Int) -> ObjectModel {
        let object = dummyObjects[index]
        didReturnObject = true
        return object
    }
    

}
