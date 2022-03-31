//
//  TestAPIURL.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//
@testable import Rijksmuseum
import XCTest
class TestAPIURL: XCTestCase {

    func testAPIURL_AllExpected_ShouldMatch() {
        guard let scheme = APIURL.urlComponent?.scheme else { fatalError("Failed to find scheme") }
        guard let path = APIURL.urlComponent?.path else { fatalError("Failed to find path") }
        guard let host = APIURL.urlComponent?.host else { fatalError("Failed to find host") }
        guard let query = APIURL.urlComponent?.query else { fatalError("Failed to find query") }
        guard let queryItems = APIURL.urlComponent?.queryItems else { fatalError("Failed to find query items") }
        let urlString = APIURL.getURL()
        
        let expectedScheme = "https"
        let expectedPath = "/api/en/collection"
        let expectedHost = "www.rijksmuseum.nl"
        let expectedQueries = "key=\(APIURL.apiKey)&ps=\(kProductPerPage)"
        let expectedQueryItems = [URLQueryItem(name: "key", value: "\(APIURL.apiKey)"),
                                  URLQueryItem(name: "ps", value: "\(kProductPerPage)")]
        let expectedUrlString = "https://www.rijksmuseum.nl/api/en/collection?key=\(APIURL.apiKey)&ps=\(kProductPerPage)"
        
        XCTAssertEqual(scheme, expectedScheme)
        XCTAssertEqual(path, expectedPath)
        XCTAssertEqual(host, expectedHost)
        XCTAssertEqual(query, expectedQueries)
        XCTAssertEqual(queryItems, expectedQueryItems)
        XCTAssertEqual(urlString, expectedUrlString)
    }
    
}
