//
//  ViewController.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

protocol LoginContentView: class {
    func set(state: LoginController.State)
    func setToNavigation(controllers: [UIViewController])
}

class LoginController: UIViewController {

    enum State {
        case `default`
        case emptyFields
        case wrongPassword
        case unregisteredUser
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private lazy var presenter: AbstractLoginPresenter = {
        return LoginPresenter(contentView: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
        set(state: .default)
        addKeyboardObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @IBAction func onRegisterDidTap(_ sender: UIButton) {
        presenter.gotoRegistration()
    }
    
    @IBAction func onlogInDidTap(_ sender: UIButton) {
        presenter.logIn(email: usernameField.text ?? "",
                        password: passwordField.text ?? "")
    }
}

extension LoginController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField == usernameField ? usernameField : passwordField).resignFirstResponder()
        return true
    }
}

extension LoginController {
    
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                           selector: #selector(onKeyboardWillShow(_:)),
                           name: UIResponder.keyboardWillShowNotification,
                           object: nil)
        
        NotificationCenter.default.addObserver(self,
                           selector: #selector(onKeyboardWillHide(_:)),
                           name: UIResponder.keyboardWillHideNotification,
                           object: nil)
    }

    @objc func onKeyboardWillShow(_ notification: Notification) {
        guard let keyboardRect = notification
            .userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect else {
            return
        }

        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRect.height, right: 0)
        scrollView.contentInset = insets
    }
    
    @objc func onKeyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
}

extension LoginController: LoginContentView {
    
    func set(state: State) {
        switch state {
        case .default:
            setBorderColor(for: passwordField, color: .gray)
            setBorderColor(for: usernameField, color: .gray)
            empty(textField: passwordField)
            empty(textField: usernameField)
            
        case .wrongPassword:
            setBorderColor(for: passwordField, color: .red)
            showAlert(with: "Password didn't match. Please, try again!")
            
        case .unregisteredUser:
            setBorderColor(for: usernameField, color: .red)
            empty(textField: passwordField)
            showAlert(with: "User does not found. Please, try again!")
            
        case .emptyFields:
            setBorderColor(for: passwordField, color: .red)
            setBorderColor(for: usernameField, color: .red)
            showAlert(with: "Fields cannot be empty! Please, enter email and password!")
        }
    }
    
    func setToNavigation(controllers: [UIViewController]) {
        navigationController?.setViewControllers(controllers, animated: true)
    }
}

private extension LoginController {
    
    func setBorderColor(for textField: UITextField, color: UIColor) {
        textField.layer.borderColor = color.cgColor
    }
    
    func empty(textField: UITextField) {
        textField.text = ""
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
