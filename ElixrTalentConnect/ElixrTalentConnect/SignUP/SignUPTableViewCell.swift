//
//  SignUPTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 17/01/24.
//

import UIKit

class SignUPTableViewCell: UITableViewCell {

    @IBOutlet weak var CellView: UIView!
    
    @IBOutlet weak var CellImage: UIImageView!
    
    @IBOutlet weak var CellLabel: UILabel!
    
    @IBOutlet weak var CellText: UITextField!
    
    @IBOutlet weak var CellButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
