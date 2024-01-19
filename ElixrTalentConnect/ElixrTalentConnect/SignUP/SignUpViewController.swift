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
    
    private let viewModel = SignUpViewModel()
    
    @IBAction func SignUpTapped(_ sender: Any) {
        let fullNameCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .fullName) ?? 0, section: 0)) as? SignUPTableViewCell
        let emailCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .emailAddress) ?? 0, section: 0)) as? SignUPTableViewCell
        let passwordCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .textPassword) ?? 0, section: 0)) as? SignUPTableViewCell
        let confirmPasswordCell = tableView.cellForRow(at: IndexPath(row: viewModel.tableValues.firstIndex(of: .confirmPassword) ?? 0, section: 0)) as? SignUPTableViewCell
        let fullName = fullNameCell?.cellTextField.text
        let email = emailCell?.cellTextField.text
        let password = passwordCell?.cellTextField.text
        let confirmPassword = confirmPasswordCell?.cellTextField.text
        
        if let errorMessage = viewModel.validateSignUp(fullName: fullName, emailAddress: email, password: password, confirmPassword: confirmPassword) {
                showAlert(message: errorMessage)
            } else {
                self.performSegue(withIdentifier: "SignUpToHome", sender: nil)
            }
    }
    
    
    //let tableValues: [SignUpModel] = [.fullName, .emailAddress, .textPassword , .confirmPassword]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SignUPTableViewCell else {
            return UITableViewCell()
        }
        let tableValue = viewModel.tableValues[indexPath.row]
        cell.cellLabel.text = tableValue.title
        cell.cellTextField.placeholder = tableValue.placeholderText
        cell.cellImage.image = tableValue.systemImage
        
        if tableValue == .textPassword || tableValue == .confirmPassword {
            cell.cellButton.setImage(UIImage(systemName: "eye"), for: .normal)
            cell.cellButton.tintColor = .gray
            
            cell.eyeButtonTapped = {
                cell.cellTextField.isSecureTextEntry.toggle()
                
                let imageName = cell.cellTextField.isSecureTextEntry ? "eye.slash" : "eye"
                cell.cellButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
        } else {
          
            cell.cellButton.isHidden = true
        }
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
    

}
