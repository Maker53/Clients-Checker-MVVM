//
//  IClientListViewModel.swift
//  Clients Checker
//
//  Created by Станислав on 31.07.2022.
//

import RealmSwift

protocol IClientListViewModel {
    
    func fetchClients(completion: @escaping () -> Void)
    func numberOfSections() -> Int
    func numberOfRowsInSection() -> Int
    func getClientCellViewModel(at indexPath: IndexPath) -> IClientCellViewModel
    func getClientDetailsViewModel(at indexPath: IndexPath?) -> IClientDetailsViewModel
}
