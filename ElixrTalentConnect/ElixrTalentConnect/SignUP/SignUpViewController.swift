//
//  SignUpViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 15/01/24.
//

import UIKit

class SignUpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    // MARK: - IBOutlets

    /// To go back to the login page
    /// - Parameter sender: The object that triggered the action.
   @IBAction func backArrowTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    /// To go back to thre login page
    /// - Parameter sender: The object that triggered the action.
    @IBAction func GoToSignInTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signUpView: UIView!
    /// check validation when signup tapped
    /// - Parameter sender: The object that triggered the action.
    @IBAction func SignUpTapped(_ sender: Any) {
        authenticateSignUp()
    }
    
    // MARK: - Properties
    
    // Get the SignUpModel for the current row
     let viewModel = SignUpViewModel()
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    deinit {
           // Unsubscribe from keyboard notifications
           NotificationCenter.default.removeObserver(self)
       }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SignUPTableViewCell else {
            return UITableViewCell()
        }
        // Get the SignUpModel for the current row
        let tableValue = viewModel.tableValues[indexPath.row]
        // Configure the cell based on the SignUpModel
        cell.cellLabel.text = tableValue.title
        cell.cellTextField.placeholder = tableValue.placeholderText
        cell.cellImage.image = tableValue.systemImage
        // Handle special cases for password fields
        if tableValue == .textPassword || tableValue == .confirmPassword {
            cell.cellButton.setImage(UIImage(systemName: "eye"), for: .normal)
            cell.cellButton.tintColor = .gray
            // Set the initial image and tint color for the eye button
            // Set up the closure to toggle the secure text entry of the password field
            cell.eyeButtonTapped = {
                cell.cellTextField.isSecureTextEntry.toggle()
                // Update the eye button image based on the secure text entry state
                let imageName = cell.cellTextField.isSecureTextEntry ? "eye.slash" : "eye"
                cell.cellButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
        } else {
            // Hide the button for non-password fields
            cell.cellButton.isHidden = true
        }
        cell.cellTextField.delegate = self 
        // Return the configured cell
        return cell
    }
    
    // To authenticate the signup
    func authenticateSignUp() {
        let fullNameCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .fullName) ?? 0, section: 0)) as? SignUPTableViewCell
        let emailCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .emailAddress) ?? 0, section: 0)) as? SignUPTableViewCell
        let passwordCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .textPassword) ?? 0, section: 0)) as? SignUPTableViewCell
        let confirmPasswordCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .confirmPassword) ?? 0, section: 0)) as? SignUPTableViewCell
        // Extract user input from cells
        let fullName = fullNameCell?.cellTextField.text
        let email = emailCell?.cellTextField.text
        let password = passwordCell?.cellTextField.text
        let confirmPassword = confirmPasswordCell?.cellTextField.text
        // Validate sign-up information
        if let errorMessage = viewModel.validateSignUp(fullName: fullName, emailAddress: email, password: password, confirmPassword: confirmPassword) {
                showAlert(message: errorMessage)
            } else {
                self.performSegue(withIdentifier: "SignUpToHome", sender: nil)
            }
    }
    
    // MARK: - Alert
    
    /// To show alert
    /// - Parameter message: The message to be shown in the alert.
     func showAlert(message: String) {
           let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }
    
    // MARK: - Keyboard adjustment
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y = -keyboardSize.height + 200
        }
      }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        self.view.frame.origin.y = 0
      }
}
