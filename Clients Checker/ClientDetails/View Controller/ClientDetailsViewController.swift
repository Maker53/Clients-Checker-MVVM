//
//  ClientDetailsViewController.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

class ClientDetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: ClientDetailsViewControllerDelegate!
    var viewModel: IClientDetailsViewModel! {
        didSet {
            title = viewModel.title
        }
    }
    var mainView: ClientDetailsView? {
        view as? ClientDetailsView
    }
    
    // MARK: - Override Methods
    
    override func loadView() {
        view = ClientDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
}

// MARK: - Private Methods

extension ClientDetailsViewController {
    
    private func setupNavigationBar() {
        let cancelBarButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancelBarButtonTapped)
        )
        
        let saveBarButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveBarButtonTapped)
        )
        
        saveBarButton.isEnabled = true
        
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = saveBarButton
    }
    
    // MARK: - Private Target-Actions
    
    @objc private func cancelBarButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveBarButtonTapped() {
        viewModel.clientName = mainView?.nameTextField.text
        viewModel.location = mainView?.locationTextField.text
        viewModel.date = mainView?.datePicker.date
        
        viewModel.saveClient { [weak self] in
            self?.delegate.reloadData()
        }
        
        dismiss(animated: true)
    }
}
