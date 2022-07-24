//
//  ClientListView.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

class ClientListView: UIView {
    
    // MARK: - Public UI Properties
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.rowHeight = UITableView.automaticDimension
        // TODO: привести в соответсвие с реальным размером ячеек
        tableView.estimatedRowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ClientListCell.self, forCellReuseIdentifier: ClientListCell.identifier)
        
        return tableView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension ClientListView {
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
