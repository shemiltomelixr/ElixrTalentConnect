//
//  ProfileViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 04/02/24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        navigationController?.setNavigationBarHidden(true, animated: false)
       
    }
    
    func design(){
       // profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        //profileImage.layer.masksToBounds = true
        //profileImage.layer.borderWidth = 2.0
        //profileImage.layer.borderColor = UIColor.black.cgColor
        
    }

}
