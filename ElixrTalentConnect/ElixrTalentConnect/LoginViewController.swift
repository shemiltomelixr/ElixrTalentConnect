//
//  LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 10/01/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var elixrSymbolImage: UIImageView!
    @IBOutlet weak var signinBottomView: UIView!
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elixrSymbolImage.layer.cornerRadius = 20
        signinBottomView.layer.shadowColor = UIColor.black.cgColor
        signinBottomView.layer.shadowOpacity = 0.5
        signinBottomView.layer.shadowRadius = 4
        signinBottomView.layer.cornerRadius = 20
        
        setUserTextFieldLeftSystemImage(textField: userEmail, systemName: "envelope", tintColor: .orange)
        setUserTextFieldLeftSystemImage(textField: userPassword, systemName: "lock", tintColor: .orange)
        
       
       

        
    }
    func setUserTextFieldLeftSystemImage(textField: UITextField, systemName: String, tintColor: UIColor) {
        let imageView = UIImageView(image: UIImage(systemName: systemName))
        imageView.tintColor = tintColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.height))
        paddingView.addSubview(imageView)
        imageView.center = CGPoint(x: paddingView.bounds.midX, y: paddingView.bounds.midY)
        textField.leftView = paddingView
        textField.leftViewMode = .always
       }
 

}
