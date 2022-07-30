//
//  Client.swift
//  Clients Checker
//
//  Created by Станислав on 28.07.2022.
//

import RealmSwift

class Client: Object, ObjectKeyIdentifiable {
    
    @Persisted var clientName = ""
    @Persisted var location = ""
    @Persisted var visitDate = Date()
    @Persisted var isDone = false
    @Persisted(primaryKey: true) var id: ObjectId
}
