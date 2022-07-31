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
    
    // MARK: - Private Properties
    
    private var clientListViewModel: IClientListViewModel! {
        didSet {
            clientListViewModel.fetchClients { [unowned self] in
                self.mainView?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Override Methods
    
    override func loadView() {
        view = ClientListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView?.tableView.dataSource = self
        mainView?.tableView.delegate = self
        mainView?.delegate = self
        
        clientListViewModel = ClientListViewModel()
    }
}

extension ClientListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        clientListViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clientListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ClientCell.identifier,
            for: indexPath
        ) as? ClientCell else { return UITableViewCell() }
        
        cell.clientCellViewModel = clientListViewModel.getClientCellViewModel(at: indexPath)
        cell.configure()
        
        return cell
    }
}

extension ClientListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let clientDetailsViewModel = clientListViewModel.getClientDetailsViewModel(at: indexPath)
        let navigationController = clientListViewModel.getClientDetailsNavigationController(
            withDelegate: self,
            andViewModel: clientDetailsViewModel)
        
        present(navigationController, animated: true)
    }
}

// MARK: - ClientListViewDelegate

extension ClientListViewController: ClientListViewDelegate {
    
    func addNewClientButtonPressed() {
        let clientDetailsViewModel = clientListViewModel.getClientDetailsViewModel(at: nil)
        let navigationController = clientListViewModel.getClientDetailsNavigationController(
            withDelegate: self,
            andViewModel: clientDetailsViewModel)
        
        present(navigationController, animated: true)
    }
}

extension ClientListViewController: ClientDetailsViewControllerDelegate {
    
    func reloadData() {
        mainView?.tableView.reloadData()
    }
}
