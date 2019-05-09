//
//  RegisterationController.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit
import MBProgressHUD

class RegisterationController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var additionalTextField: UITextField!
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    private var presenter: RegisterationPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RegisterationPresenter(contentView: self)
        mainTextField.delegate = self
        additionalTextField.delegate = self
        title = "Registration"
        addKeyboardObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func onNextDidTap(_ sender: Any) {
        presenter.onNext(currentData: mainTextField.text ?? "",
                         checker: additionalTextField.text ?? "")
    }
}

extension RegisterationController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.setBorder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField == mainTextField ? mainTextField : additionalTextField).resignFirstResponder()
        return true
    }
}

extension RegisterationController {
    
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

private extension RegisterationController {
    
    func resetState() {
        mainTextField.setBorder()
        additionalTextField.setBorder()
        mainTextField.clear()
        additionalTextField.clear()
    }
    
    func set(model: RegisterRouteModel) {
        titleLabel.text = model.title
        additionalTextField.isHidden = !model.isPassword
        imageView.image = model.image
        mainTextField.placeholder = model.placeholder
        mainTextField.isSecureTextEntry = model.isPassword
        additionalTextField.placeholder = model.placeholder
        resetState()
    }
}

extension RegisterationController: RegisterationContentView {
    
    func showHud() {
        MBProgressHUD.showAnimated(onView: view)
    }
    
    func hideHud() {
        MBProgressHUD.hideAnimated(forView: view)
    }
    
    func setSuccessfulRegState() {
        showAlert("Success",
                  with: "Registration successful! Please, loggin now!",
                  completion: { [weak self] in
            self?.popToLoginPage()
        })
    }

    func setDataDidNotMatchState() {
        mainTextField.setBorder(with: .red)
        additionalTextField.setBorder(with: .red)
        mainTextField.clear()
        additionalTextField.clear()
        showAlert(with: "Inputs did not match. Please, try again!")
    }
    
    func setUserEmptyDataState() {
        mainTextField.setBorder(with: .red)
        additionalTextField.setBorder(with: .red)
        showAlert(with: "Fields cannot be empty! Please, enter email and password!")
    }
    
    func setUserAlreadyExistState() {
        mainTextField.setBorder(with: .red)
        additionalTextField.setBorder(with: .red)
        showAlert(with: "User with such email has been already registered! Please, try another one!")
    }
    
    func setUndefinedErrorState() {
        showAlert(with: "Something went wrong! Please, try again later!")
    }
    
    func popToLoginPage() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func update(with model: RegisterRouteModel, animated: Bool) {
        guard animated else {
            set(model: model)
            return
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.subviews.forEach({ $0.alpha = 0 })
        }) { _ in
            self.set(model: model)
            UIView.animate(withDuration: 0.5) {
                self.view.subviews.forEach({ $0.alpha = 1 })
            }
        }
    }
}
