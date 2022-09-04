//
//  ClientListTableViewDataSource.swift
//  Clients Checker
//
//  Created by Станислав on 12.08.2022.
//

import UIKit

class ClientListTableViewDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private let viewModel: IClientListViewModel!
    
    // MARK: - Initializer
    
    init(viewModel: IClientListViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }

    // MARK: - Public Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ClientCell.identifier,
            for: indexPath
        ) as? ClientCell else { return UITableViewCell() }
        
        cell.clientCellViewModel = viewModel.getClientCellViewModel(at: indexPath)
        cell.configure()
        
        return cell
    }
}
