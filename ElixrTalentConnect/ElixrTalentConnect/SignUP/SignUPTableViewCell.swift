//
//  SignUPTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 17/01/24.
//

import UIKit

class SignUPTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var cellTextField: UITextField!
    
    
    @IBOutlet weak var cellButton: UIButton!
    var eyeButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.borderWidth = 0.5
        cellView.layer.borderColor = UIColor.gray.cgColor
        
        cellButton.addTarget(self, action: #selector(eyeButtonTapped(_:)), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func eyeButtonTapped(_ sender: UIButton) {
           eyeButtonTapped?()
       }

}
