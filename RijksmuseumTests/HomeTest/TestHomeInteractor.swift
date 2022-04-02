//
//  TestHomeInteractor.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import XCTest

class TestHomeInteractor: XCTestCase {
    
    var sut: HomeInteractor!
    var mockPresenter: MockHomePresenter!
    
    override func setUp() {
        super.setUp()
        sut = HomeInteractor()
        mockPresenter = MockHomePresenter()
        sut.presenter = mockPresenter
        mockPresenter.interactor = sut
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHomeInteractor_WhenHomePresenterWantsNewObject_ShouldProvideObjectForIndex() {
        let indexPath = IndexPath(row: 0, section: 0)
        let object = sut.objectFor(indexPath.row)
        XCTAssertEqual(object.title, dummyObjects[0].title)
    }
    
}
