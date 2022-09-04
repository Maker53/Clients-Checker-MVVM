//
//  Coordinator.swift
//  Clients Checker
//
//  Created by Станислав on 04.09.2022.
//

import UIKit

enum Event {
    
    case showClientDetails(with: IClientDetailsViewModel)
}

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
    func eventOccurred(_ event: Event)
}
