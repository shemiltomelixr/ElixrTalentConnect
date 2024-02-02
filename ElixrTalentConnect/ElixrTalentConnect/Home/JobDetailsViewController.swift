//
//  JobDetailsViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 30/01/24.
//

import UIKit

class JobDetailsViewController: UIViewController {
    
    /// The job object to display details.
    var job: Job?
    //var viewModel = HomeViewModel()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var keyResposnsibilitiesLabel: UILabel!
    @IBOutlet weak var qualificationLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var wishListButtonInJobDetails: UIButton!
    @IBAction func wishListButtonInJobDetailsTapped(_ sender: Any) {
        //viewModel.wishList()
        wishList()
        wishListButtonAppearance()
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        design()
        wishListButtonAppearance()
    }
    
    // MARK: - Configuration
    
    /// Configures the view with job details.
    func configureView() {
        guard let job = job else {
            return
        }
        titleLabel.text = job.title
        descriptionLabel.text = job.description
        keyResposnsibilitiesLabel.text = job.responsibilities
        qualificationLabel.text = job.requirements
        locationLabel.text = job.location
    }
    
    func design(){
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 2.0
        profileImage.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func wishListButtonAppearance(){
        guard let jobUniqueId = job?.id else { return }
        let isWishlist = UserDefaults.standard.bool(forKey: jobUniqueId)
        if isWishlist {
            wishListButtonInJobDetails.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            wishListButtonInJobDetails.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    func wishList(){
        guard let jobUniqueId = job?.id else { return }
        let isWishlist = UserDefaults.standard.bool(forKey: jobUniqueId)
        UserDefaults.standard.set(!isWishlist, forKey: jobUniqueId)
        
    }
    
}
