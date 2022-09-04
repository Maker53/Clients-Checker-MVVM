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
    
    func fetchObjects(_ type: Client.Type, completion: (Results<Client>) -> Void) {
        let objects = realm.objects(type)
        completion(objects)
    }
    
    func saveObject(_ object: Client, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            try! realm.write {
                realm.add(object)
                completion()
            }
        }
    }
    
    func updateObject(_ block: @escaping () -> Void) {
        DispatchQueue.main.async {
            try! realm.write {
                block()
            }
        }
    }
}
