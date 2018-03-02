//
//  UserDataGateway.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 02/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation

protocol UserDataGateway {
    func fetchUsers(completion: @escaping (_ users: Result<[UserModel]>) -> ())
}
