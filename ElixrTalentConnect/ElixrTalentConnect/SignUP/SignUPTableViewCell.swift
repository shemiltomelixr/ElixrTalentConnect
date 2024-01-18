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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.borderWidth = 0.5
        cellView.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
