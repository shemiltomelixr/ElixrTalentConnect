//
//  HomeTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 21/01/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var deadLineLabel: UILabel!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var jobDetailsView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        homedesign()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ job: Job) {
        titleLabel.text = job.title
        //cell.departmentLabel.text = job.department
        descriptionLabel.text = job.description
        locationLabel.text = job.location
        deadLineLabel.text = job.deadlineDate
    }
    func homedesign(){
        dateView.layer.cornerRadius = 5
        jobDetailsView.layer.cornerRadius = 10
        
    }
   

}
