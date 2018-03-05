//
//  UserListViewSpy.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 03/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation
@testable import MVP_Tests

class UserListViewSpy: UserListView {

    var nibName = ""
    var identifier = ""
    var refrestTableViewCalled = false
    var detailsUserModel: UserModel!
    var albumsUserModel: UserModel!
    var messageDisplayed: String = ""
    
    func registerNibWith(name: String, forCellIdentifier identifier: String) {
        nibName = name
        self.identifier = identifier
    }
    
    func refreshTableView() {
        refrestTableViewCalled = true
    }
    
    func detailsButtonTappedForCellWith(model: UserModel) {
        detailsUserModel = model
    }
    
    func albumsButtonTappedForCellWith(model: UserModel) {
        albumsUserModel = model
    }
    
    func display(message: String) {
        messageDisplayed = message
    }
}
