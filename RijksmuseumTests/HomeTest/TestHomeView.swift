//
//  TestHomeView.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import XCTest

class TestHomeView: XCTestCase {
    
    var sut: HomeView!
    var mockHomePresenter: MockHomePresenter!
    
    override func setUp() {
        super.setUp()
        sut = HomeView()
        mockHomePresenter = MockHomePresenter()
        sut.presenter = mockHomePresenter
    }
    
    override func tearDown() {
        sut = nil
        mockHomePresenter = nil
        super.tearDown()
    }
    
    func testHomeView_WhenMoreButtonActionReceived_ShouldPassObjectToPresenter() {
        let object = dummyObjects[0]
        XCTAssertNil(mockHomePresenter.artObject)
        sut.moreInfoButtonAction(with: object)
        XCTAssertNotNil(mockHomePresenter.artObject)
    }
    
    func testHomeView_WhenMoreButtonActionReceived_ShouldSendRequestOnce() {
        let object = dummyObjects[0]
        sut.moreInfoButtonAction(with: object)
        XCTAssertEqual(mockHomePresenter.numberReceivePresentDetailViewRequest, 1)
        XCTAssertTrue(mockHomePresenter.didReceivePresentDetailViewRequest)
    }
    
}
