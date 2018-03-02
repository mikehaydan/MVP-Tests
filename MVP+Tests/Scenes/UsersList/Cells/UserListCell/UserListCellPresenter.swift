//
//  UserListCellPresenter.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 02/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import UIKit

protocol UserListCellDelegate: class {
    func detailsButtonTappedForCellAt(indexPath: IndexPath)
    func albumsButtonTappedForCellAt(indexPath: IndexPath)
}
protocol UserListCellView: class {
    var presenter: UserListCellPresenter! { get }
    func set(userName: String, fullName: String)
    func set(detailsButtonText: String, albumsButtonText: String)
}

protocol UserListCellPresenter {
    init(view: UserListCellView)
    func configureWith(model: UserModel, delegate: UserListCellDelegate?, atIndexPath indexPAth: IndexPath)
    func prepareViewUI()
    func detailsButtonTapped()
    func albumsButtonTapped()
}

class UserListCellPresenterImplementation: UserListCellPresenter {
    
    //MARK: - Properties
    
    unowned let view: UserListCellView
    
    private var indexPath: IndexPath!
    
    private weak var delegate: UserListCellDelegate?
    
    //MARK: - LifeCycle
    
    required init(view: UserListCellView) {
        self.view = view
    }
    
    //MARK: - Private
    
    
    
    //MARK: - Public
    
    func configureWith(model: UserModel, delegate: UserListCellDelegate?, atIndexPath indexPath: IndexPath) {
        self.indexPath = indexPath
        self.delegate = delegate
        view.set(userName: model.userName, fullName: model.name)
    }
    
    func prepareViewUI() {
        view.set(detailsButtonText: "User details", albumsButtonText: "Albums")
    }
    
    func detailsButtonTapped() {
        delegate?.detailsButtonTappedForCellAt(indexPath: indexPath)
    }
    
    func albumsButtonTapped() {
        delegate?.albumsButtonTappedForCellAt(indexPath: indexPath)
    }
    
}
