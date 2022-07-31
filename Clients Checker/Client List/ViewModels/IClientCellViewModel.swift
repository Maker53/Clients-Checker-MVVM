//
//  IClientCellViewModel.swift
//  Clients Checker
//
//  Created by Станислав on 31.07.2022.
//

import Foundation

protocol IClientCellViewModel {
    
    static var identifier: String { get }
    var clientName: String { get }
    var location: String { get }
    var time: String { get }
    var isDone: Bool { get }
    var viewModelDidChange: ((IClientCellViewModel) -> Void)? { get set }
    
    init(client: Client)
    
    func checkMarkPressed()
}
