//
//  MockHomeWireFrame.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockHomeWireframe: HomeWireframeInterface {
    static func makeHomeView() -> VIEW {
        let view = VIEW()
        return view
    }
}
