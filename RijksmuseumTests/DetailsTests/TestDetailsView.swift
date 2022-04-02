//
//  TestDetailsView.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import XCTest

class TestDetailsView: XCTestCase {
    
    var sut: DetailsView!
    var mockPresenter: MockDetailsPresenter!
    
    override func setUp() {
        super.setUp()
        sut = DetailsView()
        mockPresenter = MockDetailsPresenter()
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    func testDetailsView_WhenReceivingArtObject_TextFieldShouldContainText() {
        XCTAssertTrue(sut.textView.text == "")
        sut.updateView(with: dummyObjects[0])
        XCTAssertTrue(sut.textView.text != "")
    }
    
    func testDetailsView_WhenReceivingArtObject_HeaderImageViewShouldContainImage() {
        XCTAssertNil(sut.headerImage.image)
        sut.updateView(with: dummyObjects[0])
        XCTAssertNotNil(sut.headerImage.image)
    }
    
}
