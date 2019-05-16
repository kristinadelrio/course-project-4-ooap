//
//  ViewController.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit
import MBProgressHUD

protocol LoginContentView: class {
    func setDefaultState()
    func setEmptyFieldsState()
    func setWrongPasswordState()
    func setunregisteredUserState()
    func navigate(to controller: UIViewController)
}

class LoginController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var lightGray = UIColor.lightGray.withAlphaComponent(0.5)
    private lazy var presenter: AbstractLoginPresenter = {
        return LoginPresenter(contentView: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
        setDefaultState()
        addKeyboardObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func onRegisterDidTap(_ sender: UIButton) {
        presenter.gotoRegistration()
    }
    
    @IBAction func onlogInDidTap(_ sender: UIButton) {
        MBProgressHUD.showAnimated(onView: view)
        presenter.logIn(email: usernameField.text ?? "",
                        password: passwordField.text ?? "")
    }
}

extension LoginController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.setBorder()
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
    
    func setDefaultState() {
        MBProgressHUD.hideAnimated(forView: view)
        usernameField.setBorder()
        passwordField.setBorder()
        usernameField.clear()
        passwordField.clear()
    }
    
    func setWrongPasswordState() {
        MBProgressHUD.hideAnimated(forView: view)
        usernameField.setBorder()
        passwordField.setBorder(with: .red)
        showAlert(with: "Password didn't match. Please, try again!")
    }
    
    func setunregisteredUserState() {
        MBProgressHUD.hideAnimated(forView: view)
        usernameField.setBorder(with: .red)
        passwordField.setBorder()
        passwordField.clear()
        showAlert(with: "User does not found. Please, try again!")
    }
    
    func setEmptyFieldsState() {
        MBProgressHUD.hideAnimated(forView: view)
        if passwordField.text == "" { passwordField.setBorder(with: .red) }
        if usernameField.text == "" { usernameField.setBorder(with: .red) }
        showAlert(with: "Fields cannot be empty! Please, enter email and password!")
    }
    
    func navigate(to controller: UIViewController) {
        MBProgressHUD.hideAnimated(forView: view)
        navigationController?.pushViewController(controller, animated: true)
    }
}
