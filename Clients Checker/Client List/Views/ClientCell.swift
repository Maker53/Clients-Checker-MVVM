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
            clientCellViewModel.viewModelDidChange = { [unowned self] viewModel in
                self.setCheckMarkStatus(viewModel.isDone)
            }
        }
    }
    
    // MARK: - UI Private Properties
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkMarkButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "checkmark.circle")
        
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(checkMarkPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var locationSymbolImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(systemName: "mappin")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var timeSymbolImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "clock")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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
    
    // MARK: - Public Methods
    
    func configure() {
        nameLabel.text = clientCellViewModel.clientName
        locationLabel.text = clientCellViewModel.location
        timeLabel.text = clientCellViewModel.time
        
        setCheckMarkStatus(clientCellViewModel.isDone)
    }
}

// MARK: - Private Methods

extension ClientCell {
    
    private func setCheckMarkStatus(_ status: Bool) {
        if status {
            checkMarkButton.tintColor = #colorLiteral(red: 0.3812560439, green: 0.3763138056, blue: 0.6871632934, alpha: 1)
        } else {
            checkMarkButton.tintColor = #colorLiteral(red: 0.8784313725, green: 0.8825196028, blue: 0.9808915257, alpha: 0.500750207)
        }
    }
    
    private func addSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(checkMarkButton)
        contentView.addSubview(locationSymbolImageView)
        contentView.addSubview(timeSymbolImageView)
        contentView.addSubview(separatorView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            
            locationSymbolImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationSymbolImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            locationSymbolImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            locationLabel.leadingAnchor.constraint(equalTo: locationSymbolImageView.trailingAnchor, constant: 5),
            locationLabel.topAnchor.constraint(equalTo: locationSymbolImageView.topAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: locationSymbolImageView.bottomAnchor),
            
            separatorView.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 5),
            separatorView.bottomAnchor.constraint(equalTo: locationSymbolImageView.bottomAnchor),
            separatorView.topAnchor.constraint(equalTo: locationSymbolImageView.topAnchor),
            separatorView.widthAnchor.constraint(equalToConstant: 1.5),
            
            timeSymbolImageView.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 5),
            timeSymbolImageView.topAnchor.constraint(equalTo: locationSymbolImageView.topAnchor),
            timeSymbolImageView.bottomAnchor.constraint(equalTo: locationSymbolImageView.bottomAnchor),
            
            timeLabel.leadingAnchor.constraint(equalTo: timeSymbolImageView.trailingAnchor, constant: 5),
            timeLabel.topAnchor.constraint(equalTo: locationSymbolImageView.topAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: locationSymbolImageView.bottomAnchor),
            
            checkMarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkMarkButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkMarkButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
            checkMarkButton.leadingAnchor.constraint(greaterThanOrEqualTo: timeLabel.trailingAnchor, constant: 20),
            checkMarkButton.heightAnchor.constraint(equalToConstant: 30),
            checkMarkButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: - Target Actions
    
    @objc private func checkMarkPressed() {
        clientCellViewModel.checkMarkPressed()
    }
}

