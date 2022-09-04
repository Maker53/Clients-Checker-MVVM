//
//  ClientCellViewModel.swift
//  Clients Checker
//
//  Created by Станислав on 31.07.2022.
//

import Foundation

class ClientCellViewModel: IClientCellViewModel {
    
    // MARK: - Public Properties
    
    static var identifier: String {
        String(describing: ClientCell.self)
    }
    
    var clientName: String {
        client.clientName
    }
    var location: String {
        client.location
    }
    
    var time: String {
        dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
        let time = dateFormatter.string(from: client.visitDate)
        
        return time
    }
    
    var isDone: Box<Bool>
    
    // MARK: - Private Properties
    
    private let client: Client
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        return dateFormatter
    }()
    
    // MARK: - Initializer
    
    required init(client: Client) {
        self.client = client
        isDone = Box(client.isDone)
    }
    
    // MARK: - Public Methods
    
    func checkMarkPressed() {
        isDone.value.toggle()
        StorageManager.shared.updateObject { client.isDone = isDone.value }
    }
}
