//
//  ClientDetailsViewDelegate.swift
//  Clients Checker
//
//  Created by Станислав on 01.08.2022.
//

import UIKit

protocol ClientDetailsViewDelegate: AnyObject {
    
    func cancelBarButtonTapped()
    func saveBarButtonTapped()
    func textFieldChanged()
}
