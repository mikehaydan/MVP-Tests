//
//  UserApiModel.swift
//  MVP+TestsTests
//
//  Created by Mike Haydan on 03/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation
@testable import MVP_Tests

extension UserModel {
    static func createUserModelArray(numberOfElements: Int = 2) -> [UserModel] {
        var users: [UserModel] = []
        
        for i in 0..<numberOfElements {
            let user = createUser(index: i)
            users.append(user)
        }
        
        return users
    }
    
    static func createUser(index: Int = 0) -> UserModel {
        let user: UserModel = UserModel(id: index, userName: "\(index) userName", name: "\(index) name", email: "\(index)@.com", phone: "\(index)12332")
        return user
    }
}
