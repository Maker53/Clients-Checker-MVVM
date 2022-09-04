//
//  ClientDetailsViewController.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

final class ClientDetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: ClientDetailsViewControllerDelegate!
    weak var coordinator: Coordinator!
    var clientDetailsViewModel: IClientDetailsViewModel! {
        didSet {
            title = clientDetailsViewModel.title
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
        
        mainView?.delegate = self
        
        setupNavigationBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}

// MARK: - Private Methods

extension ClientDetailsViewController {
    
    private func setupNavigationBar() {
        let saveBarButton = mainView?.saveBarButton
        
        navigationItem.leftBarButtonItem = mainView?.cancelBarButton
        navigationItem.rightBarButtonItem = saveBarButton
    }
}

// MARK: - ClientDetailsViewDelegate

extension ClientDetailsViewController: ClientDetailsViewDelegate {
    
    @objc func cancelBarButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveBarButtonTapped() {
        clientDetailsViewModel.clientName = mainView?.nameTextField.text
        clientDetailsViewModel.location = mainView?.locationTextField.text
        clientDetailsViewModel.date = mainView?.datePicker.date
        
        clientDetailsViewModel.saveClient { [weak self] in
            self?.delegate.reloadData()
        }
        
        dismiss(animated: true)
    }
    
    @objc func textFieldChanged() {
        guard
            let nameText = mainView?.nameTextField.text,
            let locationText = mainView?.locationTextField.text
        else { return }
        
        if nameText.isEmpty || locationText.isEmpty {
            mainView?.saveBarButton.isEnabled = false
        } else {
            mainView?.saveBarButton.isEnabled = true
        }
    }
}
