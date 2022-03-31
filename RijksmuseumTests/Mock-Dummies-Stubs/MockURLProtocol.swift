//
//  MockURLSessionProtocol.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import UIKit
@testable import Rijksmuseum

class MockURLProtocol: URLProtocol {
    
    public static var stubJSONData: Data?
    public static var error: ErrorHandler?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let err = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: err)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubJSONData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
    }
    
}

