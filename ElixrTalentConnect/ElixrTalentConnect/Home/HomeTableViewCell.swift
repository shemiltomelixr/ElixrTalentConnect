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
    @IBOutlet weak var wishListbutton: UIButton!
    @IBAction func wishListButtonTapped(_ sender: Any) {
        viewModel.wishList()
        updateWishlistButtonAppearance()
    }
    /// initialize a new instance of HomeViewModel
    var viewModel = HomeViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        homedesign()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    /// Configures the cell with the provided job data
    /// - Parameter job: The job object containing data to be displayed in the cell.
    func configureCell(_ job: Job) {
        titleLabel.text = job.title
        descriptionLabel.text = job.description
        locationLabel.text = job.location
        // Format the deadlineDate
        if let formattedDate = viewModel.formatDate(job.deadlineDate) {
            deadLineLabel.text = formattedDate
        } else {
            deadLineLabel.text = "Invalid Date"
        }
    }
    ///  Applies custom design to the UI elements of the cell.
    func homedesign(){
        dateView.layer.cornerRadius = 5
        jobDetailsView.layer.cornerRadius = 10
    }
    /// Change the appearence to wishlisted items
    func updateWishlistButtonAppearance() {
        guard let jobUniqueId = viewModel.jobId else { return }
           let isWishlist = UserDefaults.standard.bool(forKey: jobUniqueId)
           if isWishlist {
               wishListbutton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .normal)
               jobDetailsView.backgroundColor = .systemIndigo
               titleLabel.textColor = .white
               descriptionLabel.textColor = .white
               locationLabel.textColor = .white
               
           } else {
               wishListbutton.setImage(UIImage(systemName: "heart"), for: .normal)
               jobDetailsView.backgroundColor = .systemGray6
               titleLabel.textColor = .black
               descriptionLabel.textColor = .black
               locationLabel.textColor = .gray
           }
      }
}
