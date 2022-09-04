//
//  IClientDetailsViewModel.swift
//  Clients Checker
//
//  Created by Станислав on 30.07.2022.
//

import Foundation

protocol IClientDetailsViewModel {
    
    var title: String { get }
    var clientName: String? { get set }
    var location: String? { get set }
    var date: Date? { get set }
    
    init(client: Client?)
    
    func saveClient(completion: @escaping () -> Void)
}
