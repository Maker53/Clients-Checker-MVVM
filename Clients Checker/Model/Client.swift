//
//  Client.swift
//  Clients Checker
//
//  Created by Станислав on 28.07.2022.
//

import RealmSwift

class Client: Object {
    
    @Persisted var clientName: String
    @Persisted var location: String
    @Persisted var visitDate: Date
    @Persisted var isDone = false
    
    convenience init(clientName: String, location: String, visitDate: Date) {
        self.init()
        self.clientName = clientName
        self.location = location
        self.visitDate = visitDate
    }
}
