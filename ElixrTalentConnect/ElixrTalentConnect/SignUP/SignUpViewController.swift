//
//  SignUpViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 15/01/24.
//

import UIKit

class SignUpViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBAction func BackArrowTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func GoToSignInTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func SignUpTapped(_ sender: Any) {
        
       authenticateSignUp()
     
        
    }
    
    
    let tableValues: [SignUpModel] = [.fullName, .emailAddress, .textPassword , .confirmPassword]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SignUPTableViewCell else {
            return UITableViewCell()
        }
        let tableValue = tableValues[indexPath.row]
        cell.cellLabel.text = tableValue.title
        cell.cellTextField.placeholder = tableValue.placeholderText
        cell.cellImage.image = tableValue.systemImage
        return cell
        
        
       
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)

        
    }
    

    private func showAlert(message: String) {
           let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }
    func authenticateSignUp() {
        guard let fullNameCell = tableView.cellForRow(at: IndexPath(row: tableValues.firstIndex(of: .fullName) ?? 0, section: 0)) as? SignUPTableViewCell else {
                  return
              }

              if let fullName = fullNameCell.cellTextField.text, fullName.isEmpty {
                  showAlert(message: "Please enter your full name.")
                  return
              }
        
        guard let emailCell = tableView.cellForRow(at: IndexPath(row: tableValues.firstIndex(of: .emailAddress) ?? 0, section: 0)) as? SignUPTableViewCell else {
                  return
              }

              if let email = emailCell.cellTextField.text,
                  !email.contains("@") || !email.contains(".") {
                  showAlert(message: "Please enter a valid email address.")
                  return
              }
      
        guard let passwordCell = tableView.cellForRow(at: IndexPath(row: tableValues.firstIndex(of: .textPassword) ?? 0, section: 0)) as? SignUPTableViewCell,
                     let confirmPasswordCell = tableView.cellForRow(at: IndexPath(row: tableValues.firstIndex(of: .confirmPassword) ?? 0, section: 0)) as? SignUPTableViewCell else {
                   return
               }

               let password = passwordCell.cellTextField.text ?? ""
               let confirmPassword = confirmPasswordCell.cellTextField.text ?? ""

               if password.isEmpty || confirmPassword.isEmpty {
                   showAlert(message: "Password fields cannot be empty.")
                   return
               }

               let containsAlphabetic = password.contains { $0.isLetter }
               let containsNumeric = password.contains { $0.isNumber }

               if !containsAlphabetic || !containsNumeric {
                   showAlert(message: "Password should contain both alphabetic and numeric characters.")
                   return
               }

               if password.count < 8 {
                   showAlert(message: "Password should be at least 8 characters long.")
                   return
               }

               if password != confirmPassword {
                   showAlert(message: "Passwords do not match.")
                   return
               }
        navigationController?.popViewController(animated: true)
    }

}
