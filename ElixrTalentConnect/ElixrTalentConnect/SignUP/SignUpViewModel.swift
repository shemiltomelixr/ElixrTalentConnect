//
//  SignUpViewModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 19/01/24.
//

import Foundation
class SignUpViewModel {
    var tableValues: [SignUpModel] = [.fullName, .emailAddress, .textPassword, .confirmPassword]
    
    func validateSignUp(fullName: String?, emailAddress: String?, password: String?, confirmPassword: String?) -> String? {
        guard let fullName = fullName, !fullName.isEmpty else {
            return "Please enter your full name."
        }
        
       
        guard let email = emailAddress, !email.isEmpty, email.contains("@"), email.contains(".") else {
            return "Please enter a valid email address."
        }
        
     
        guard let password = password, !password.isEmpty, password.count >= 8, password.contains(where: { $0.isLetter }), password.contains(where: { $0.isNumber }) else {
            return "Password should be at least 8 characters long and contain both alphabetic and numeric characters."
        }
     
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty, confirmPassword == password else {
            return "Passwords do not match."
        }
       
        return nil
    }
}
