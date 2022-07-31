//
//  IStorageManager.swift
//  Clients Checker
//
//  Created by Станислав on 28.07.2022.
//

import RealmSwift

protocol IStorageManager {
    
    static var shared: IStorageManager { get }
    
    func fetchObjects(_ type: Client.Type) -> Results<Client>
    func saveObject(_ object: Client)
    func updateObject(_ object: Client)
}
