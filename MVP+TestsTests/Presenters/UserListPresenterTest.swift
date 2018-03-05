//
//  UserListPresenter.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 03/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import XCTest
@testable import MVP_Tests

class UserListPresenterTest: XCTestCase {
    
    let viewSpy = UserListViewSpy()
    let userDataGatewayStub = UserDataGatewayStub()
    
    var presenter: UserListPresenterImplementation!
    
    override func setUp() {
        super.setUp()
        
        presenter = UserListPresenterImplementation(view: viewSpy, request: userDataGatewayStub)
    }
    
    //MARK: - Tests
    
    func test_getUsers_success_refrestTableView_called() {
        //given
        let users = UserModel.createUserModelArray()
        userDataGatewayStub.resultToBeReturned = Result.success(users)
        
        //when
        presenter.getUsers()
        
        //then
        XCTAssertTrue(viewSpy.refrestTableViewCalled, "Refresh table view is not called")
    }
    
    func test_getUsers_failure_refrestTableView_called() {
        //given
        let error = NSError.parseError
        userDataGatewayStub.resultToBeReturned = Result.failure(error)
        
        //when
        presenter.getUsers()
        
        //then
        XCTAssertEqual(viewSpy.messageDisplayed, error.localizedDescription, "Dispalyer not correct message")
    }
    
    func test_configureCell_displays_correct_data() {
        //given
        presenter.dataSource = UserModel.createUserModelArray()
        let expectedUserName = "0 userName"
        let expectedName = "0 name"
        
        let cellViewSpy = UserListCellViewSpy()
        let cellPresenter = UserListCellPresenterImplementation(view: cellViewSpy)
        
        //when
        cellPresenter.configureWith(model: presenter.dataSource.first!, delegate: presenter, atIndex: 0)
        
        //then
        XCTAssertEqual(cellViewSpy.fullName, expectedName, "The expected fullName not displayed")
        XCTAssertEqual(cellViewSpy.userName, expectedUserName, "The expected userName not displayed")
    }
    
    func test_CnfigureTableView_cells_regiser() {
        //given
        let expectedCellIdentifier = UserListTableViewCell.nibName
        let expectedCellNibName = UserListTableViewCell.nibName
        
        //when
        presenter.configureTableView()
        
        //then
        XCTAssertEqual(viewSpy.nibName, expectedCellNibName, "The expected nibName is not setted")
        XCTAssertEqual(viewSpy.identifier, expectedCellIdentifier, "The expected cellIdentifier is not setted")
    }
    
    func test_dataSourceCount() {
        //given
        let expectedDataSourceCount = 2
        let users = UserModel.createUserModelArray()
        userDataGatewayStub.resultToBeReturned = Result.success(users)
        
        //when
        presenter.getUsers()
        
        //then
        XCTAssertEqual(presenter.dataSourceCount, expectedDataSourceCount, "The expected dataSourceCount is not the same")
    }
    
    func test_detailsButtonTapped_on_cell() {
        //given
        let user = UserModel.createUser()
        presenter.dataSource = [user]
        
        let cellViewSpy = UserListCellViewSpy()
        let cellPresenter = UserListCellPresenterImplementation(view: cellViewSpy)
        cellPresenter.configureWith(model: user, delegate: presenter, atIndex: 0)
        
        //when
        cellPresenter.detailsButtonTapped()
        
        //then
        XCTAssertEqual(viewSpy.detailsUserModel.id, user.id, "The seteed user is not the same")
    }
    
    func test_albumsButtonTapped_on_cell() {
        //given
        let user = UserModel.createUser()
        presenter.dataSource = [user]
        
        let cellViewSpy = UserListCellViewSpy()
        let cellPresenter = UserListCellPresenterImplementation(view: cellViewSpy)
        cellPresenter.configureWith(model: user, delegate: presenter, atIndex: 0)
        
        //when
        cellPresenter.albumsButtonTapped()
        
        //then
        XCTAssertEqual(viewSpy.albumsUserModel.id, user.id, "The seteed user is not the same")
    }
}
