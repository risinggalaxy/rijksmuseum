//
//  MockHomeWireFrame.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockHomeWireframe: HomeWireframeInterface {
    
    var didPresentDetailsViewWithObject: Bool = false
    var object: ObjectModel? {
        didSet {
            didPresentDetailsViewWithObject = true
        }
    }
    
    static func makeHomeView() -> VIEW {
        let view = VIEW()
        return view
    }
    
    func presentDetailsView(with object: ObjectModel, on view: VIEW) {
        self.object = object
    }
    
}
