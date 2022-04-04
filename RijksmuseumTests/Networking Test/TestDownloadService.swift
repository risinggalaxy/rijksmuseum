//
//  TestDownloadService.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import XCTest

class TestDownloadService: XCTestCase {
    
    var sut: DownloadService!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        sut = DownloadService(urlSession: urlSession, urlString: APIURL.getURL())
    }
    
    override func tearDown() {
        sut = nil
        MockURLProtocol.stubData = nil
        MockURLProtocol.error = nil
        super.tearDown()
    }
    
    func testDownloadServiceTest_WhenEmptyURLStringProvided_ErrorHappens() {
        let expectation = expectation(description: "An Empty String Provided")
        sut = DownloadService(urlString:"")
        sut.downloader { (data, error) in
            XCTAssertNil(data)
            XCTAssertEqual(error, ErrorHandler.failedToLoadURL)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testDownloadServiceTest_WhenURLRequestFailsDownloading_ErrorHappens() {
        let expectation = expectation(description: "Request Failed Downloading")
        let errorDescription = "The operation couldn’t be completed \n due to an error while download request"
        MockURLProtocol.error = ErrorHandler.failedRequest(description: errorDescription)
        MockURLProtocol.stubData = nil
        sut.downloader { (data, error) in
            XCTAssertNil(data)
            XCTAssertEqual(error, ErrorHandler.failedRequest(description: errorDescription))
            expectation.fulfill()
        }
        expectation.assertForOverFulfill = false
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testDownloadServiceTest_WhenDataReceived_ShouldPassTest() {
        let expectation = expectation(description: "Data Was Received")
        guard let receivedData = mockJSON else { return }
        MockURLProtocol.stubData = receivedData
        sut.downloader { (data, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
}
