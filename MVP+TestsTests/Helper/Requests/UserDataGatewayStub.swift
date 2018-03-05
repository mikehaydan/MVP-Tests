//
//  UserDataGatewayTest.swift
//  MVP+TestsTests
//
//  Created by Mike Haydan on 03/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation
@testable import MVP_Tests

class UserDataGatewayStub: UserDataGateway {

    var resultToBeReturned: Result<[UserModel]>!
    
    func fetchUsers(completion: @escaping (Result<[UserModel]>) -> ()) {
        completion(resultToBeReturned)
    }
}
