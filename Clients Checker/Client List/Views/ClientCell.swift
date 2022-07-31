//
//  ClientCell.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

class ClientCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: ClientCell.self)
    var clientCellViewModel: IClientCellViewModel! {
        didSet {
            configure()
        }
    }
    
    // MARK: - UI Private Properties
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkMarkImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "checkmark.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var locationSymbolLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var timeSymbolLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension ClientCell {
    
    private func configure() {
        nameLabel.text = clientCellViewModel.clientName
        locationLabel.text = clientCellViewModel.location
        timeLabel.text = clientCellViewModel.time
        
        if clientCellViewModel.isDone {
            checkMarkImageView.tintColor = #colorLiteral(red: 0.3812560439, green: 0.3763138056, blue: 0.6871632934, alpha: 1)
        } else {
            checkMarkImageView.tintColor = #colorLiteral(red: 0.8784313725, green: 0.8825196028, blue: 0.9808915257, alpha: 0.500750207)
        }
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(locationLabel)
        addSubview(timeLabel)
        addSubview(checkMarkImageView)
        addSubview(locationSymbolLabel)
        addSubview(timeSymbolLabel)
        addSubview(separatorView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            locationSymbolLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            locationSymbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            locationSymbolLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            locationLabel.leadingAnchor.constraint(equalTo: locationSymbolLabel.trailingAnchor, constant: 5),
            locationLabel.topAnchor.constraint(equalTo: locationSymbolLabel.topAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: locationSymbolLabel.bottomAnchor),
            
            separatorView.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 5),
            separatorView.bottomAnchor.constraint(equalTo: locationSymbolLabel.bottomAnchor),
            separatorView.topAnchor.constraint(equalTo: locationSymbolLabel.topAnchor),
            separatorView.widthAnchor.constraint(equalToConstant: 1.5),
            
            timeSymbolLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 5),
            timeSymbolLabel.topAnchor.constraint(equalTo: locationSymbolLabel.topAnchor),
            timeSymbolLabel.bottomAnchor.constraint(equalTo: locationSymbolLabel.bottomAnchor),
            
            timeLabel.leadingAnchor.constraint(equalTo: timeSymbolLabel.trailingAnchor, constant: 5),
            timeLabel.topAnchor.constraint(equalTo: locationSymbolLabel.topAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: locationSymbolLabel.bottomAnchor),
            
            checkMarkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            checkMarkImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMarkImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
            checkMarkImageView.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 20)
        ])
    }
}

