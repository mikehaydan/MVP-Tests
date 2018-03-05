//
//  UserModel.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 02/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation

struct UserApiModel: InitializableWithData, InitializableWithJson {
    let id: Int
    let userName: String
    let name: String
    let email: String
    let phone: String
    
    init(data: Data?) throws {
        if let data = data {
            let jsonDecoder = JSONDecoder()
            do {
                let model = try jsonDecoder.decode(UserApiModel.self, from: data)
                self = model
            } catch {
                throw NSError.parseError
            }
        } else {
            throw NSError.parseError
        }
    }
    
    init(json: [String : Any]) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json)
            try self.init(data: jsonData)
        } catch {
            throw NSError.parseError
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "username"
        case name
        case email
        case phone
    }
}

extension UserApiModel {
    var user: UserModel {
        let user: UserModel = UserModel(id: id, userName: userName, name: name, email: email, phone: phone)
        return user
    }
}

struct UserAddress {
    let street: String
    let city: String
    let zipCode: String
    let geoData: UserGeo
}

struct UserGeo {
    let latitude: String
    let longitude: String
}

struct UserCompany {
    let name: String
    let bs: String
    let catchPhrase: String
}
