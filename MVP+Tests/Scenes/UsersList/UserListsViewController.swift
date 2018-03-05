//
//  UserListsViewController.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 01/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import UIKit

class UserListsViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: UserListPresenter!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiClient = ApiClientImplelentation.defaultConfiguration
        let getUserRequest = UserDataGatewayImplelementation(apiClient: apiClient)
        presenter = UserListPresenterImplementation(view: self, request: getUserRequest)
        presenter.getUsers()
    }
    
    //MARK: - IBActions
    
    
    
    //MARK: - Private
    
    
    
    //MARK: - Public

}

//MARK: - UserListView

extension UserListsViewController: UserListView {
    
    func registerNibWith(name: String, forCellIdentifier identifier: String) {
        let nib = UINib(nibName: name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func refreshTableView() {
        tableView.reloadData()
    }
    
    func detailsButtonTappedForCellWith(model: UserModel) {
        
    }
    
    func albumsButtonTappedForCellWith(model: UserModel) {
        
    }
    
    func display(message: String) {
        print(message)
    }
}

//MARK: - UITableViewDataSource

extension UserListsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSourceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.userCellIdentifier, for: indexPath) as! UserListTableViewCell
        presenter.configure(view: cell, atIndex: indexPath.row)
        return cell
    }
}
