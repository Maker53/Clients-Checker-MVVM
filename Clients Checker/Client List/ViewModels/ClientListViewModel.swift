//
//  ClientListViewModel.swift
//  Clients Checker
//
//  Created by Станислав on 31.07.2022.
//

import RealmSwift

class ClientListViewModel: IClientListViewModel {
    
    private var clients: Results<Client>!
    
    func fetchClients(completion: @escaping () -> Void) {
        StorageManager.shared.fetchObjects(Client.self) { [unowned self] clients in
            self.clients = clients
            completion()
        }
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRowsInSection() -> Int {
        clients.count
    }
    
    func getClientCellViewModel(at indexPath: IndexPath) -> IClientCellViewModel {
        ClientCellViewModel(client: clients[indexPath.row])
    }
    
    func getClientDetailsViewModel(at indexPath: IndexPath?) -> IClientDetailsViewModel {
        if let indexPath = indexPath {
            return ClientDetailsViewModel(client: clients[indexPath.row])
        } else {
            return ClientDetailsViewModel(client: nil)
        }
    }
}
