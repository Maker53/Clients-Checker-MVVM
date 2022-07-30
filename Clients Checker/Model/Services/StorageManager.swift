//
//  StorageManager.swift
//  Clients Checker
//
//  Created by Станислав on 28.07.2022.
//

import RealmSwift

fileprivate let realm = try! Realm()

class StorageManager: IStorageManager {
    
    func fetchObjects(_ type: Client.Type) -> Results<Client> {
        realm.objects(type)
    }
    
    func saveObject(_ object: Client) {
        try! realm.write {
            realm.add(object)
        }
    }
}
