//
//  TestHomePresenter.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import XCTest

class TestHomePresenter: XCTestCase {
    
    var sut: HomePresenter!
    var mockView: MockHomeView!
    var mockInteractor: MockHomeInteractor!
    var mockWireframe: MockHomeWireframe!
    
    override func setUp() {
        super.setUp()
        sut = HomePresenter()
        mockInteractor = MockHomeInteractor()
        mockView = MockHomeView()
        mockWireframe = MockHomeWireframe()
        mockView.presenter = sut
        mockInteractor.presenter = sut
        sut.interactor = mockInteractor
        sut.wireframe = mockWireframe
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testHomePresenter_WhenHomeViewCollectionViewReturnsNewCell_ShouldProvideObjectForIndexPath() {
        let indexPath = IndexPath(item: 0, section: 0)
        let object = sut.objectFor(indexPath.row)
        XCTAssertEqual(object.title, dummyObjects[0].title)
        XCTAssertTrue(mockInteractor.didReturnObject)
    }
    
    func testHomePresenter_WhenUserTapsMoreInfoButtonOnHomeView_ShouldPresentDetailsViewForObject() {
        let indexPath = IndexPath(item: 0, section: 0)
        let object = sut.objectFor(indexPath.row)
        let view = MockHomeWireframe.makeHomeView()
        XCTAssertNil(mockWireframe.object)
        sut.presentDetailsView(with: object, on: view)
        XCTAssertNotNil(mockWireframe.object)
        XCTAssertTrue(mockWireframe.didPresentDetailsViewWithObject)
    }
    
    func testHomePresenter_ImageForCell_ShouldDownloadImageData() {
        let expectation = XCTestExpectation(description: "Data Passed")
        guard let imageData = UIImage(named: "webImage")?.pngData() else { return }
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        MockURLProtocol.stubData = imageData
        let urlSession = URLSession(configuration: configuration)
        sut.imageForCell(with: dummyObjects[0].webImage.url, and: urlSession) { receivedData in
            XCTAssertEqual(receivedData, imageData)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
