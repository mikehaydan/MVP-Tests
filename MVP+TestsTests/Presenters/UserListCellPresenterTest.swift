//
//  UserListCellPresenterTest.swift
//  MVP+TestsTests
//
//  Created by Mike Haydan on 06/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import XCTest

@testable import MVP_Tests

class UserListCellPresenterTest: XCTestCase {
    
    let cellViewSpy = UserListCellViewSpy()
    var presenter: UserListCellPresenterImplementation!
    
    override func setUp() {
        super.setUp()
        
        presenter = UserListCellPresenterImplementation(view: cellViewSpy)
    }
    
    func test_prepareViewUI() {
        
        //given
        let expectedDetailsText = "User details"
        let expectedAlbumsText = "Albums"
        
        //when
        presenter.prepareViewUI()
        
        //then
        XCTAssertEqual(expectedDetailsText, cellViewSpy.detailsButtonText, "Details text is not the same")
        XCTAssertEqual(expectedAlbumsText, cellViewSpy.albumsButtonText, "Albums text is not the same")
    }
    
}
