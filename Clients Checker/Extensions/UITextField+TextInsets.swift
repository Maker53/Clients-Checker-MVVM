//
//  UITextField+TextInsets.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
