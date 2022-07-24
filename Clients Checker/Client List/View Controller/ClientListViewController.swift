//
//  ClientListViewController.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

class ClientListViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var mainView: ClientListView? {
        view as? ClientListView
    }
    
    // MARK: - Override Methods
    
    override func loadView() {
        view = ClientListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
}
