//
//  MockDetailsWireFrame.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockDetailsWireframe: DetailsWireframeInterface {
    
    static func makeDetailsView(with object: ObjectModel) -> VIEW {
        let view = VIEW()
        return view
    }
    
    static func makeDetailsView() -> VIEW {
        let view = VIEW()
        return view
    }
}
