//
//  ClientDetailsView.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

class ClientDetailsView: UIView {
    
    // MARK: - Public UI Properties
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        textField.returnKeyType = .next
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.3812560439, green: 0.3763138056, blue: 0.6871632934, alpha: 1)
        textField.backgroundColor = #colorLiteral(red: 0.877543211, green: 0.8825196028, blue: 0.9808915257, alpha: 0.5)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Введите имя",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        textField.setLeftPadding(15)
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        return textField
    }()
    
    lazy var locationTextField: UITextField = {
        let textField = UITextField()
        
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.3812560439, green: 0.3763138056, blue: 0.6871632934, alpha: 1)
        textField.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8825196028, blue: 0.9808915257, alpha: 0.75)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Введите место приема",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        textField.setLeftPadding(15)
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        return textField
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        
        datePicker.locale = Locale(identifier: "Ru_ru")
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 10
        datePicker.contentHorizontalAlignment = .left
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    lazy var cancelBarButton = UIBarButtonItem(
        barButtonSystemItem: .cancel,
        target: self,
        action: #selector(cancelBarButtonTapped)
    )
    
    lazy var saveBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveBarButtonTapped)
        )
        
        button.isEnabled = false
        
        return button
    }()
    
    // MARK: - Public Properties
    
    weak var delegate: ClientDetailsViewDelegate!
    
    // MARK: - Private UI Properties
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Имя"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Место приема"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Дата"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension ClientDetailsView {
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(locationLabel)
        addSubview(locationTextField)
        addSubview(dateLabel)
        addSubview(datePicker)
    }
    
    private func setupConstraints() {
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            
            nameTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            nameTextField.heightAnchor.constraint(equalToConstant: 55),
            
            locationLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            locationLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            
            locationTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            locationTextField.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            locationTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            locationTextField.heightAnchor.constraint(equalToConstant: 55),
            
            dateLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20),
            
            datePicker.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10)
        ])
    }
    
    // MARK: - Target Actions
    
    @objc private func cancelBarButtonTapped() {
        delegate.cancelBarButtonTapped()
    }
    
    @objc private func saveBarButtonTapped() {
        delegate.saveBarButtonTapped()
    }
    
    @objc private func textFieldChanged() {
        delegate.textFieldChanged()
    }
}
