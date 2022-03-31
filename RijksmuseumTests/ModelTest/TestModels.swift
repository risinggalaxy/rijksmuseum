//
//  TestModels.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import Foundation
import XCTest

class TestModel: XCTestCase {
    
    var sut: MainModel!
    
    override func setUp() {
        super.setUp()
        let webImage = WebImageModel(url: "someURL")
        let headerImage = HeaderImageModel(url: webImage.url)
        let object = ObjectModel(id: "en-BK-1963-101",
                                 objectNumber: "BK-1963-101", title: "Seated Cupid",
                                 longTitle: "Seated Cupid, Étienne-Maurice Falconet, 1757",
                                 hasImage: true, principalOrFirstMaker: "Étienne-Maurice Falconet",
                                 showImage: true, webImage: webImage, headerImage: headerImage)
        sut = MainModel(artObjects: [object])
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMainModel_ArtObjectsShouldNotBeEmpty() {
        let objects = sut.artObjects
        XCTAssertTrue(!objects.isEmpty)
    }
    
    func testMainModel_ArtObjectShouldHaveWebAndHeaderImageURL() {
        let webImageURL = sut.artObjects[0].webImage.url
        let headerImageURL = sut.artObjects[0].headerImage.url
        XCTAssertEqual(webImageURL, "someURL")
        XCTAssertEqual(headerImageURL, "someURL")
    }
    
    func testMainModel_ObjectShouldHaveImageAndShowImagePropertiesSetToTrue() {
        let hasImage = sut.artObjects[0].hasImage
        let showImage = sut.artObjects[0].showImage
        XCTAssertTrue(hasImage)
        XCTAssertTrue(showImage)
    }
    
    func testMainModel_ObjectShouldHaveID_ObjectNumber_Title_LongTitle_PrincipalOrFirstMakerProperties() {
        let object = sut.artObjects[0]
        let id = object.id
        let number = object.objectNumber
        let title = object.title
        let longTitle = object.longTitle
        let firstMaker = object.principalOrFirstMaker
        XCTAssertEqual(id, "en-BK-1963-101")
        XCTAssertEqual(number, "BK-1963-101")
        XCTAssertEqual(title, "Seated Cupid")
        XCTAssertEqual(longTitle, "Seated Cupid, Étienne-Maurice Falconet, 1757")
        XCTAssertEqual(firstMaker, "Étienne-Maurice Falconet")
    }
    
}
