//
//  ClientDetailsViewController.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

class ClientDetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    var mainView: ClientDetailsView? {
        view as? ClientDetailsView
    }
    
    // MARK: - Override Methods
    
    override func loadView() {
        view = ClientDetailsView()
    }
}
