//
//  LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 10/01/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var elixrSymbolImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elixrSymbolImage.layer.cornerRadius = 20
        elixrSymbolImage.layer.shadowColor = UIColor.darkGray.cgColor
        elixrSymbolImage.layer.shadowOpacity = 0.5
        elixrSymbolImage.layer.shadowRadius = 5
       
       

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
