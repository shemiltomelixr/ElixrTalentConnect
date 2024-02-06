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
        navigationController?.setNavigationBarHidden(true, animated: false)
       
    }
}
