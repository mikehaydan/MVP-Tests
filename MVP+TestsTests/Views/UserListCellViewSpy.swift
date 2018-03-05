//
//  UserListCellViewSpy.swift
//  MVP+TestsTests
//
//  Created by Mike Haydan on 03/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation
@testable import MVP_Tests


class UserListCellViewSpy: UserListCellView {
    
    var userName = ""
    var fullName = ""
    var detailsButtonText = ""
    var albumsButtonText = ""
    
    var presenter: UserListCellPresenter!
    
    func set(userName: String, fullName: String) {
        self.userName = userName
        self.fullName = fullName
    }
    
    func set(detailsButtonText: String, albumsButtonText: String) {
        self.detailsButtonText = detailsButtonText
        self.albumsButtonText = albumsButtonText
    }
}
