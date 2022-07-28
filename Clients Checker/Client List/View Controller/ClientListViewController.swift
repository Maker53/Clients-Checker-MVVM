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
        
        mainView?.tableView.dataSource = self
        mainView?.delegate = self
    }
}

extension ClientListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ClientListCell.identifier,
            for: indexPath
        ) as? ClientListCell else { return UITableViewCell() }
        
        return cell
    }
}

// MARK: - ClientListViewDelegate

extension ClientListViewController: ClientListViewDelegate {
    
    func addNewClientButtonPressed() {
        let clientDetailsViewController = ClientDetailsViewController()
        let navigationController = UINavigationController(rootViewController: clientDetailsViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        present(navigationController, animated: true)
    }
}
