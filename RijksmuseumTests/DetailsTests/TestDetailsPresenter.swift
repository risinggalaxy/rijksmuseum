//
//  TestDetailsPresenter.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import XCTest

class TestDetailsPresenter: XCTestCase {
    
    var sut: DetailsPresenter!
    var mockView: MockDetailsView!
    var mockInteractor: MockDetailsInteractor!
    var mockWireframe: MockDetailsWireframe!
    
    override func setUp() {
        super.setUp()
        sut = DetailsPresenter()
        mockView = MockDetailsView()
        mockInteractor = MockDetailsInteractor()
        mockWireframe = MockDetailsWireframe()
        sut.view = mockView
        sut.interactor = mockInteractor
        sut.wireframe = mockWireframe
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockWireframe =  nil
        super.tearDown()
    }
    
    func testDetailsPresenter_WhenReceivingUpdateFromInteractor_ShouldPushToDetailsView() {
        XCTAssertNil(mockView.artObject)
        XCTAssertFalse(mockView.didReceiveUpdateFromPresenter)
        XCTAssertEqual(mockView.numberUpdateWasPushed, .zero)
        sut.updateDetailsView(with: dummyObjects[0])
        XCTAssertNotNil(mockView.artObject)
        XCTAssertTrue(mockView.didReceiveUpdateFromPresenter)
        XCTAssertEqual(mockView.numberUpdateWasPushed, 1)
    }
    
    
}
