//
//  SignUpViewModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 19/01/24.
//

import Foundation

class SignUpViewModel {
    
    // Array of SignUpModel which enum values representing sign-up fields
    var tableValues: [SignUpModel] = [.fullName, .emailAddress, .textPassword, .confirmPassword]
    
    // MARK: - validation
    
    /// Validates the sign-up information.
    /// - Parameters:
    ///   - fullName: The full name entered by the user.
    ///   - emailAddress: The email address entered by the user.
    ///   - password: The password entered by the user.
    ///   - confirmPassword: The confirmed password entered by the user.
    /// - Returns: An error message if validation fails, otherwise nil.
    func validateSignUp(fullName: String?, emailAddress: String?, password: String?, confirmPassword: String?) -> String? {
        // Validate full name
        guard let fullName = fullName, !fullName.isEmpty else {
            return "Please enter your full name."
        }
        // Validate email address
        guard let email = emailAddress, !email.isEmpty, email.contains("@"), email.contains(".") else {
            return "Please enter a valid email address."
        }
        // Validate password
        guard let password = password, !password.isEmpty, password.count >= 8, password.contains(where: { $0.isLetter }), password.contains(where: { $0.isNumber }) else {
            return "Password should be at least 8 characters long and contain both alphabetic and numeric characters."
        }
        // Validate password confirmation
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty, confirmPassword == password else {
            return "Passwords do not match."
        }
        // Validation successful
        return nil
    }
}
