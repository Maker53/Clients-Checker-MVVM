//
//  IStorageManager.swift
//  Clients Checker
//
//  Created by Станислав on 28.07.2022.
//

import RealmSwift

protocol IStorageManager {
    
    static var shared: IStorageManager { get }
    
    func fetchObjects(_ type: Client.Type, completion: (Results<Client>) -> Void)
    func saveObject(_ object: Client, completion: @escaping () -> Void)
    func updateObject(_ block: @escaping () -> Void)
}
