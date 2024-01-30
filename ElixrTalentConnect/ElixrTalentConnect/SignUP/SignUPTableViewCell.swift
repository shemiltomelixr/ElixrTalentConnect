//
//  SignUPTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 17/01/24.
//

import UIKit

class SignUPTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var cellButton: UIButton!
    // Closure to handle eye button tap
    var eyeButtonTapped: (() -> Void)?
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Set up the cell design
        signUpDesign()
        //Eye button tap handling
        cellButton.addTarget(self, action: #selector(eyeButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Handle eye button tap
    /// - Parameter sender: The button that triggered the action.
    @objc private func eyeButtonTapped(_ sender: UIButton) {
           eyeButtonTapped?()
    }
    
    // MARK: - design
    
    /// design for signup page
    func signUpDesign(){
        cellView.layer.borderWidth = 0.5
        cellView.layer.borderColor = UIColor.gray.cgColor
    }
}
