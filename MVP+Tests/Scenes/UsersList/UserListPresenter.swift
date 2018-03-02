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
    init(view: UserListView)
    func configureTableView()
    func configure(view: UserListCellView, atIndexPath indexPath: IndexPath)
    func getUsers()
}

protocol UserListView: class {
    func register(nib: UINib, forCellIdentifier identifier: String)
    func refreshTableView()
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
    
    private var dataSource: [UserModel] = []
    
    private var getUserRequest: UserDataGateway
    
    //MARK: - LifeCycle
    
    required init(view: UserListView) {
        self.view = view
        
        let apiClient = ApiClientImplelentation(urlSessionconfiguration: .default, completionQueue: .main)
        getUserRequest = UserDataGatewayImplelementation(apiClient: apiClient)
    }

    //MARK: - Private
    
    //MARK: - Public
    
    func configureTableView() {
        view.register(nib: UserListTableViewCell.nib, forCellIdentifier: userCellIdentifier)
    }
    
    func configure(view: UserListCellView, atIndexPath indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        view.presenter.configureWith(model: model, delegate: self, atIndexPath: indexPath)
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
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - UserListCellDelegate

extension UserListPresenterImplementation: UserListCellDelegate {
    
    func detailsButtonTappedForCellAt(indexPath: IndexPath) {
        
    }
    
    func albumsButtonTappedForCellAt(indexPath: IndexPath) {
        
    }
}
