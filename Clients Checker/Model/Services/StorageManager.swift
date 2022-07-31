//
//  StorageManager.swift
//  Clients Checker
//
//  Created by Станислав on 28.07.2022.
//

import RealmSwift

fileprivate let realm = try! Realm()

class StorageManager: IStorageManager {
    
    static var shared: IStorageManager {
        StorageManager()
    }
    
    private init() {}
    
    func fetchObjects(_ type: Client.Type) -> Results<Client> {
        realm.objects(type)
    }
    
    func saveObject(_ object: Client) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func updateObject(_ object: Client) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
}
