//
//  ClientListTableViewDelegate.swift
//  Clients Checker
//
//  Created by Станислав on 12.08.2022.
//

import UIKit

class ClientListTableViewDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Private Properties
    
    private let viewModel: IClientListViewModel!
    private weak var coordinator: Coordinator!
    
    // MARK: - Initializer
    
    init(viewModel: IClientListViewModel, coordinator: Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init()
    }
    
    // MARK: - Public Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let clientDetailsViewModel = viewModel.getClientDetailsViewModel(at: indexPath)
        
        coordinator.eventOccurred(.showClientDetails(with: clientDetailsViewModel))
    }
}
