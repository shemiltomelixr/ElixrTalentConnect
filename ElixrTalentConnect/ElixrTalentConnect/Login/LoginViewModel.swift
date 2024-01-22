//
//  LoginViewModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 16/01/24.
//

import Foundation
import UIKit
import LocalAuthentication
/// Handles the business logic and validation for the login functionality.
class LoginViewModel {
    /// Validates user login credentials.
    /// - Parameter model: The login model containing user credentials
    /// - Returns: A tuple indicating whether the credentials are valid and an optional error message.
    func validateCredentials(model: LoginModel) -> (isValid: Bool, message: String?) {
        // Validate email
        guard !model.email.isEmpty, model.email.contains("@"), model.email.contains(".") else {
            return (false, "Please enter a valid email.")
        }
       // Validate password
        guard !model.password.isEmpty, isAlphanumeric(model.password), model.password.count >= 8 else {
            return (false, "Please enter a valid alphanumeric password.")
        }
        // Credentials are valid
        return (true, nil)
    }
    /// Authenticates the user with biometric authentication.
    /// - Parameter completion: A closure to be called upon completion of biometric authentication, indicating success or failure.
    func authenticateWithBiometrics(completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        var error: NSError?
        // Check if the device supports biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // Perform biometric authentication
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Biometrics") { (success, evalError) in
                DispatchQueue.main.async {
                    completion(success, evalError)
                }
            }
        } else {
            // Biometric authentication is not available
            completion(false, error)
        }
    }
    /// Checks if the given string is alphanumeric.
    /// - Parameter string: The string to be checked.
    /// - Returns: A boolean indicating whether the string is alphanumeric.
    func isAlphanumeric(_ string: String) -> Bool {
        let letterSet = CharacterSet.letters
        let digitSet = CharacterSet.decimalDigits
        return !string.isEmpty && string.rangeOfCharacter(from: letterSet) != nil && string.rangeOfCharacter(from: digitSet) != nil
    }
}
