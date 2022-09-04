//
//  ClientDetailsViewModel.swift
//  Clients Checker
//
//  Created by Станислав on 30.07.2022.
//

import Foundation

final class ClientDetailsViewModel: IClientDetailsViewModel {
    
    // MARK: - Public Properties
    
    var clientName: String?
    var location: String?
    var date: Date?
    var title: String {
        if let client = currentClient {
            return client.clientName
        } else {
            return "Новый клиент"
        }
    }
    
    // MARK: - Private Properties
    
    private var currentClient: Client?
    
    // MARK: - Initializer
    
    required init(client: Client?) {
        self.currentClient = client
    }
    
    // MARK: - Public Methods
    
    func saveClient(completion: @escaping () -> Void) {
        guard
            let clientName = clientName,
            let location = location,
            let date = date
        else { return }
                
        if let client = currentClient {
            StorageManager.shared.updateObject {
                client.clientName = clientName
                client.location = location
                client.visitDate = date
                
                completion()
            }
        } else {
            let newClient = Client(clientName: clientName, location: location, visitDate: date)
            
            StorageManager.shared.saveObject(newClient) {
                completion()
            }
        }
    }
}
