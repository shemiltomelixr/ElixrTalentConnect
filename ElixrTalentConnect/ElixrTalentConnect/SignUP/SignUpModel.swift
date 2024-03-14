//
//  SignUpModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 17/01/24.
//

import Foundation
import UIKit

/// Enumeration to represent different fields in the signup
enum SignUpModel{
    case fullName
    case emailAddress
    case textPassword
    case confirmPassword
}

// Extension to SignUpModel for computed properties
extension SignUpModel {
    // Computed property to get the title for each signup field
    var title : String {
        switch self {
        case .fullName:
            return "Full NAME"
        case .emailAddress:
            return "Email ADDRESS"
        case .textPassword:
            return "PASSWORD"
        case .confirmPassword:
            return "CONFIRM PASSWORD"
        }
    }
    // Computed property to get placeholder text for each signup field
    var placeholderText : String {
        switch self {
        case .fullName:
            return "Enter Your Full NAME"
        case .emailAddress:
            return "Enter your Email ADDRESS"
        case .textPassword:
            return "Enter Your Password"
        case .confirmPassword:
            return "Confirm Your Password"
        }
    }
    // Computed property to get system image for each signup field
    var systemImage: UIImage? {
        switch self {
        case .fullName: return UIImage(systemName: "person")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .emailAddress: return UIImage(systemName: "envelope")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .textPassword: return UIImage(systemName: "lock")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .confirmPassword: return UIImage(systemName: "lock")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        }
    }
}


