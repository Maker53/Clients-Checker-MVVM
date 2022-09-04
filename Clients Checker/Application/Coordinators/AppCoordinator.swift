//
//  AppCoordinator.swift
//  Clients Checker
//
//  Created by Станислав on 04.09.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    private var clientListViewController: ClientListViewController!
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showClientListViewController()
    }
    
    func eventOccurred(_ event: Event) {
        switch event {
        case .showClientDetails(let viewModel):
            showClientDetailsViewController(with: viewModel)
        }
    }
    
    private func showClientListViewController() {
        // TODO Добавить фабрику
        clientListViewController = ClientListViewController()
        
        clientListViewController.coordinator = self
        clientListViewController.clientListViewModel = ClientListViewModel()
        clientListViewController.title = "Список клиентов"
        
        navigationController.pushViewController(clientListViewController, animated: true)
    }
    
    private func showClientDetailsViewController(with viewModel: IClientDetailsViewModel) {
        // TODO Добавить фабрику
        let viewController = ClientDetailsViewController()
        let clientDetailsNavigationController = UINavigationController(rootViewController: viewController)
        
        viewController.coordinator = self
        viewController.delegate = clientListViewController
        viewController.clientDetailsViewModel = viewModel
        
        navigationController.present(clientDetailsNavigationController, animated: true)
    }
}
