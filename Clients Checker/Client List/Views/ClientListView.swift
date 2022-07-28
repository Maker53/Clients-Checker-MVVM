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
    
    lazy var addNewCLientButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.3812560439, green: 0.3763138056, blue: 0.6871632934, alpha: 1)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(addNewClientButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Delegate
    
    weak var delegate: ClientListViewDelegate!
    
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
        addSubview(addNewCLientButton)
    }
    
    private func setupConstraints() {
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            addNewCLientButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            addNewCLientButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            addNewCLientButton.widthAnchor.constraint(equalToConstant: 50),
            addNewCLientButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Private Target-Actions
    
    @objc private func addNewClientButtonPressed() {
        delegate.addNewClientButtonPressed()
    }
}
