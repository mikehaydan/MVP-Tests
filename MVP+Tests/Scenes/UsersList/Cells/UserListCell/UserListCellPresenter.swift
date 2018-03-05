//
//  UserListCellPresenter.swift
//  MVP+Tests
//
//  Created by Mike Haydan on 02/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import UIKit

protocol UserListCellDelegate: class {
    func detailsButtonTappedForCellAt(index: Int)
    func albumsButtonTappedForCellAt(index: Int)
}
protocol UserListCellView: class {
    var presenter: UserListCellPresenter! { get }
    func set(userName: String, fullName: String)
    func set(detailsButtonText: String, albumsButtonText: String)
}

protocol UserListCellPresenter {
    init(view: UserListCellView)
    func configureWith(model: UserModel, delegate: UserListCellDelegate?, atIndex index: Int)
    func prepareViewUI()
    func detailsButtonTapped()
    func albumsButtonTapped()
}

class UserListCellPresenterImplementation: UserListCellPresenter {
    
    //MARK: - Properties
    
    unowned let view: UserListCellView
    
    private var index: Int!
    
    private weak var delegate: UserListCellDelegate?
    
    //MARK: - LifeCycle
    
    required init(view: UserListCellView) {
        self.view = view
    }
    
    //MARK: - Private
    
    
    
    //MARK: - Public
    
    func configureWith(model: UserModel, delegate: UserListCellDelegate?, atIndex index: Int) {
        self.index = index
        self.delegate = delegate
        view.set(userName: model.userName, fullName: model.name)
    }
    
    func prepareViewUI() {
        view.set(detailsButtonText: "User details", albumsButtonText: "Albums")
    }
    
    func detailsButtonTapped() {
        delegate?.detailsButtonTappedForCellAt(index: index)
    }
    
    func albumsButtonTapped() {
        delegate?.albumsButtonTappedForCellAt(index: index)
    }
    
}
