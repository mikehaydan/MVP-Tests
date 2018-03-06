//
//  UrlSessionStub.swift
//  MVP+TestsTests
//
//  Created by Mike Haydan on 06/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation

@testable import MVP_Tests

class UrlSessionStub: URLSessionProtocol {
    typealias URLSessionCompletionHandlerResponse = (data: Data?, response: URLResponse?, error: Error?)
    
    var response: [URLSessionCompletionHandlerResponse] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return StubTask(response: response.popLast()!, completionHandler: completionHandler)
    }
    
    private class StubTask: URLSessionDataTask {
        let testDoubleResponse: URLSessionCompletionHandlerResponse
        let completionHandler: (Data?, URLResponse?, Error?) -> ()
        
        init(response: URLSessionCompletionHandlerResponse, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
            self.testDoubleResponse = response
            self.completionHandler = completionHandler
        }
    }
}
