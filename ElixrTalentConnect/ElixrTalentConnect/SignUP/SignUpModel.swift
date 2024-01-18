//
//  SignUpModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 17/01/24.
//

import Foundation
import UIKit


enum SignUpModel{
    case fullName
    case emailAddress
    case textPassword
    case confirmPassword
}

extension SignUpModel {
    
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
    var placeholderText : String {
        switch self {
        case .fullName:
            return "Enter Your Full NAME"
        case .emailAddress:
            return "Enter your Email ADDRESS"
        case .textPassword:
            return "Enter Your PASSWORD"
        case .confirmPassword:
            return "Enter CONFIRM PASSWORD"
        }
   
    }
    var systemImage: UIImage? {
        switch self {
        case .fullName: return UIImage(systemName: "person")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .emailAddress: return UIImage(systemName: "envelope")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .textPassword: return UIImage(systemName: "lock")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        case .confirmPassword: return UIImage(systemName: "lock")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        }
    }
    


}


