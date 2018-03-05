//
//  UserListTableViewCell.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 02/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell, UserListCellView {

    //MARK: - Properties
    
    @IBOutlet private weak var userNameLabel: UILabel!
    
    @IBOutlet private weak var fullNameLabel: UILabel!
    
    @IBOutlet private weak var detailsButton: UIButton!
    
    @IBOutlet private weak var albumsButton: UIButton!
    
    var presenter: UserListCellPresenter!
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        presenter = UserListCellPresenterImplementation(view: self)
    }
    
    //MARK: - IBActions
    
    @IBAction func detailsButtonTapped(_ sender: Any) {
        presenter.detailsButtonTapped()
    }
    
    @IBAction func albumsButtonTapped(_ sender: Any) {
        presenter.albumsButtonTapped()
    }
    
    //MARK: - Private
    
    
    
    //MARK: - Public
    
    func set(userName: String, fullName: String) {
        userNameLabel.text = userName
        fullNameLabel.text = fullName
    }
    
    func set(detailsButtonText: String, albumsButtonText: String) {
        detailsButton.setTitle(detailsButtonText, for: .normal)
        albumsButton.setTitle(albumsButtonText, for: .normal)
    }
}

