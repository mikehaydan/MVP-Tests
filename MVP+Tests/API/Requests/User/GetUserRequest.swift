//
//  GetUserRequest.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 02/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation

struct GetUsersRequest: ApiRequest {
    var urlRequest: URLRequest {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        var request = URLRequest(url: url)
        request.httpMethod = HttpMehod.get.rawValue
        return request
    }
}

class UserDataGatewayImplelementation: UserDataGateway {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchUsers(completion: @escaping (Result<[UserModel]>) -> ()) {
        let request = GetUsersRequest()
        apiClient.execute(request: request) { (result: Result<ApiResponse<[UserModel]>>) in
            switch result {
            case let .success(response):
                let resultModels = response.model
                completion(.success(resultModels))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
