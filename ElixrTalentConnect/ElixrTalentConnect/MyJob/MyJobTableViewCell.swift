//
//  MyJobTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 05/02/24.
//

import UIKit

class MyJobTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var statuslabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //design()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(_ job: Job) {
        titleLabel.text = job.title
        descriptionLabel.text = job.description
        locationLabel.text = job.location
        statuslabel.text = job.status
        
        if statuslabel.text == "Scheduled"{
            statusView.backgroundColor = .green
        }
        else if statuslabel.text == "Rejected"{
            statusView.backgroundColor = .red
        }else{
            statusView.backgroundColor = .white
        }
        
    }
    
    func design() {
        statusView.layer.cornerRadius = 10
    }
    
    
}
