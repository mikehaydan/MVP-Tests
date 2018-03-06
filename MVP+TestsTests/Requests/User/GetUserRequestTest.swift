//
//  GetUserRequestTest.swift
//  MVP+TestsTests
//
//  Created by Mike Haydan on 05/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import XCTest
@testable import MVP_Tests

class GetUserRequestTest: XCTestCase {
    
    var userDataRequest: UserDataGatewayImplelementation!
    let apiClient = ApiClientImplelentationSpy()
    
    override func setUp() {
        super.setUp()
        
        userDataRequest = UserDataGatewayImplelementation(apiClient: apiClient)
    }
    
    func test_fetchUsers_success() {
        
        //given
        let expectedStringResponse: String = """
        [
        {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz",
            "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
                }
            },
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org",
            "company": {
                "name": "Romaguera-Crona",
                "catchPhrase": "Multi-layered client-server neural-net",
                "bs": "harness real-time e-markets"
            }
        }
        ]
    """
        let expectedData = expectedStringResponse.data(using: .utf8)
        let expectedHttpResponse = HTTPURLResponse(statusCode: 200)
        let expectedUsersModel: [UserApiModel] = try! Array(data: expectedData)
        let expectedResult = Result.success(expectedUsersModel.map({ $0.user }))
        let fetchExpectation = expectation(description: "Get Users Expectation")
        apiClient.set(response: (expectedData, expectedHttpResponse, nil))
        
        //when
        userDataRequest.fetchUsers { (response) in
            XCTAssertEqual(response, expectedResult, "Response is not the same")
            fetchExpectation.fulfill()
        }
        wait(for: [fetchExpectation], timeout: 1)
    }
    
}
