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
        
        presenter = UserListPresenterImplementation(view: self)
        presenter.getUsers()
    }
    
    //MARK: - IBActions
    
    
    
    //MARK: - Private
    
    
    
    //MARK: - Public

}

//MARK: - UserListView

extension UserListsViewController: UserListView {
    
    func register(nib: UINib, forCellIdentifier identifier: String) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func refreshTableView() {
        tableView.reloadData()
    }
}


//MARK: - UITableViewDataSource

extension UserListsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSourceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.userCellIdentifier, for: indexPath) as! UserListTableViewCell
        presenter.configure(view: cell, atIndexPath: indexPath)
        return cell
    }
}
