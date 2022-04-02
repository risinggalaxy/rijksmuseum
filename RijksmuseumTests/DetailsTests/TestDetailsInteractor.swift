//
//  TestDetailsInteractor.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import XCTest

class TestDetailsInteractor: XCTestCase {
    
    var sut: DetailsInteractor!
    var mockPresenter: MockDetailsPresenter!
    
    override func setUp() {
        super.setUp()
        sut = DetailsInteractor()
        mockPresenter = MockDetailsPresenter()
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockPresenter = nil
    }
    
    func testDetailsInteractor_WhenReceivingArtObject_ShouldUpdatePresenter() {
        XCTAssertNil(mockPresenter.artObject)
        XCTAssertEqual(mockPresenter.numberOfTimesArtObjectWasReceivedFromInteractor, .zero)
        XCTAssertFalse(mockPresenter.didReceiveUpdateFromInteractor)
        sut.object = dummyObjects[0]
        XCTAssertNotNil(mockPresenter.artObject)
        XCTAssertEqual(mockPresenter.numberOfTimesArtObjectWasReceivedFromInteractor, 1)
        XCTAssertTrue(mockPresenter.didReceiveUpdateFromInteractor)
    }
    
}
