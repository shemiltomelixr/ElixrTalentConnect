//
//  SignUpModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 17/01/24.
//

import Foundation


enum SignUpModel{
    case fullName
    case emailAddress
    case textPassword
    case confirmPassword
}

extension SignUpModel {
    
    var label : String {
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
    var placeHolder : String {
        switch self {
        case .fullName:
            return "Enter your Full NAME"
        case .emailAddress:
            return "Enter Your Email ADDRESS"
        case .textPassword:
            return "Enter Your PASSWORD"
        case .confirmPassword:
            return "CONFIRM Your PASSWORD"
        }
   
    }
    var image : String {
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
    var button : String {
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
    
    

}

