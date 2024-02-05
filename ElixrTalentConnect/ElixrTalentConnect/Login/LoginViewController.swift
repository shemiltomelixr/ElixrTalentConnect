//
//  LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 10/01/24.
//

import UIKit
import LocalAuthentication
/// Handles login view presentation.
class LoginViewController: UIViewController, UITextFieldDelegate  {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var elixrSymbolImage: UIImageView!
    @IBOutlet weak var signinBottomView: UIView!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    // MARK: - IBActions
    
    /// To validate the signup
    /// - Parameter sender: The object that initiated the action
    @IBAction func signInTapped(_ sender: Any) {
        let loginModel = LoginModel(email: userEmailTextField.text ?? "", password: userPasswordTextField.text ?? "")
        let validationResult = viewModel.validateCredentials(model: loginModel)
        if validationResult.isValid {
            viewModel.authenticateWithBiometrics { [weak self] (success, error) in
                if success {
                    self?.performSegue(withIdentifier: "LoginToHome", sender: nil)
                } else {
                    if let error = error {
                        self?.showErrorAlert(message: "Biometric authentication failed: \(error.localizedDescription)")
                    }
                }
            }
        } else {
            showErrorAlert(message: validationResult.message ?? "Invalid credentials.")
        }
    }
    /// Navigate to the sign-up screen
    /// - Parameter sender: The object that initiated the action.
    @IBAction func goToSignUpTapped(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    // MARK: - Properties
    
    /// The view model responsible for handling the business logic and data operations
    private var viewModel = LoginViewModel()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designForLogin()
        userEmailTextField.delegate = self
        userPasswordTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /// To show error
    /// - Parameter message: Message for error
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    /// Dismisses the keyboard when the "Return"  button is pressed on the keyboard.
    /// - Parameter textField: The text field for which the "Return" key was pressed.
    /// - Returns: A boolean value indicating whether the text field should process the "Return" key press.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /// Adjusts the view's frame to avoid keyboard overlap when the keyboard is about to be shown.
    /// - Parameter notification: The notification containing information about the keyboard.
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y = -keyboardSize.height
        }
    }
    
    /// Resets the view when the keyboard is about to be hidden.
    /// - Parameter notification: The notification indicating that the keyboard is about to be hidden.
    @objc func keyboardWillHide(_ notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    /// System image with reauired fields and position
    /// - Parameters:
    ///   - textField: The UITextField for which to set the left system image.
    ///   - systemName: The name of the system image to be displayed.
    ///   - tintColor: The tint color to apply to the system image.
    func setUserTextFieldLeftSystemImage(textField: UITextField, systemName: String, tintColor: UIColor) {
        let imageView = UIImageView(image: UIImage(systemName: systemName))
        imageView.tintColor = tintColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.height))
        paddingView.addSubview(imageView)
        imageView.center = CGPoint(x: paddingView.bounds.midX, y: paddingView.bounds.midY)
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    deinit {
        // Unregister from keyboard notifications
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - design
    
    /// Desing for the login page.
    func designForLogin(){
        elixrSymbolImage.layer.cornerRadius = 20
        signinBottomView.layer.shadowColor = UIColor.black.cgColor
        signinBottomView.layer.shadowOpacity = 0.5
        signinBottomView.layer.shadowRadius = 4
        signinBottomView.layer.cornerRadius = 20
        setUserTextFieldLeftSystemImage(textField: userEmailTextField, systemName: "envelope", tintColor: .orange)
        setUserTextFieldLeftSystemImage(textField: userPasswordTextField, systemName: "lock", tintColor: .orange)
    }
}
