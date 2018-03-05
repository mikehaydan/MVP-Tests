//
//  UserListPresenter.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 02/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import UIKit

protocol UserListPresenter {
    var userCellIdentifier: String { get }
    var dataSourceCount: Int { get }
    init(view: UserListView, request: UserDataGateway)
    func configureTableView()
    func configure(view: UserListCellView, atIndex index: Int)
    func getUsers()
}

protocol UserListView: class {
    func registerNibWith(name: String, forCellIdentifier identifier: String)
    func refreshTableView()
    func detailsButtonTappedForCellWith(model: UserModel)
    func albumsButtonTappedForCellWith(model: UserModel)
    func display(message: String)
}

class UserListPresenterImplementation: UserListPresenter {
    
    //MARK: - Properties
    
    var userCellIdentifier: String {
        return UserListTableViewCell.nibName
    }
    
    var dataSourceCount: Int {
        return dataSource.count
    }
    
    private unowned var view: UserListView
    
    var dataSource: [UserModel] = []
    
    private var getUserRequest: UserDataGateway
    
    //MARK: - LifeCycle
    
    required init(view: UserListView, request: UserDataGateway) {
        self.view = view
        self.getUserRequest = request
    }

    //MARK: - Private
    
    //MARK: - Public
    
    func configureTableView() {
        view.registerNibWith(name: UserListTableViewCell.nibName, forCellIdentifier: userCellIdentifier)
    }
    
    func configure(view: UserListCellView, atIndex index: Int) {
        let model = dataSource[index]
        view.presenter.configureWith(model: model, delegate: self, atIndex: index)
    }
    
    func getUsers() {
        getUserRequest.fetchUsers { [weak self] (result) in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case let .success(models):
                strongSelf.dataSource = models
                strongSelf.view.refreshTableView()
            case let .failure(error):
                strongSelf.view.display(message: error.localizedDescription)
            }
        }
    }
}

//MARK: - UserListCellDelegate

extension UserListPresenterImplementation: UserListCellDelegate {
    
    func detailsButtonTappedForCellAt(index: Int) {
        let model = dataSource[index]
        view.detailsButtonTappedForCellWith(model: model)
    }
    
    func albumsButtonTappedForCellAt(index: Int) {
        let model = dataSource[index]
        view.albumsButtonTappedForCellWith(model: model)
    }
}
