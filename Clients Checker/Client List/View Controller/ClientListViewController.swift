//
//  ClientListViewController.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

final class ClientListViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var mainView: ClientListView? {
        view as? ClientListView
    }
    
    weak var coordinator: Coordinator!
    var clientListViewModel: IClientListViewModel! {
        didSet {
            clientListViewModel.fetchClients { [unowned self] in
                self.mainView?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Private Properties
    
    private lazy var clientListTableViewDataSource = ClientListTableViewDataSource(viewModel: clientListViewModel)
    private lazy var clientListTableViewDelegate = ClientListTableViewDelegate(viewModel: clientListViewModel, coordinator: coordinator)
    
    // MARK: - Override Methods
    
    override func loadView() {
        view = ClientListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        mainView?.tableView.dataSource = clientListTableViewDataSource
        mainView?.tableView.delegate = clientListTableViewDelegate
        mainView?.delegate = self
    }
}

// MARK: - ClientDetailsViewControllerDelegate

extension ClientListViewController: ClientDetailsViewControllerDelegate {
    
    func reloadData() {
        mainView?.tableView.reloadData()
    }
}

// MARK: - ClientListViewDelegate

extension ClientListViewController: ClientListViewDelegate {
    
    func showClientDetails(at indexPath: IndexPath?) {
        let viewModel = clientListViewModel.getClientDetailsViewModel(at: indexPath)
        
        coordinator.eventOccurred(.showClientDetails(with: viewModel))
    }
}
