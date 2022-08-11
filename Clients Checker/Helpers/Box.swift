//
//  Box.swift
//  Clients Checker
//
//  Created by Станислав on 11.08.2022.
//

final class Box<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
