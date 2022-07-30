//
//  IStorageManager.swift
//  Clients Checker
//
//  Created by Станислав on 28.07.2022.
//

import RealmSwift

protocol IStorageManager {
    
    func fetchObjects(_ type: Client.Type) -> Results<Client>
//    func fetchObject(byIdentifier id: )
    func saveObject(_ object: Client)
}
