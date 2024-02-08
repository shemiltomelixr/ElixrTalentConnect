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
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var keyResposnsibilitiesLabel: UILabel!
    @IBOutlet weak var qualificationLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var wishListButtonInJobDetails: UIButton!
    //To add job to whishlist
    @IBAction func wishListButtonInJobDetailsTapped(_ sender: Any) {
        wishList()
        wishListButtonAppearance()
    }
    //To apply job
    @IBAction func applyJobButtonTapped(_ sender: Any) {
        applyJob()
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
    
    //design implementation
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
    
    //add the job id to the wishlist
    func wishList(){
        guard let jobUniqueId = job?.id else { return }
        let isWishlist = UserDefaults.standard.bool(forKey: jobUniqueId)
        UserDefaults.standard.set(!isWishlist, forKey: jobUniqueId)
    }

    // For applying the job
    func applyJob() {
        var savedJobs = getSavedJobs()
        guard let job = job, !isJobAlreadyApplied(savedJobs, job: job) else {
            print("Job has already been applied for.")
            showAlert(message: "Job already applied")
            return
        }
        savedJobs.append(job)
        let appliedJobsData = try? JSONEncoder().encode(savedJobs)
        UserDefaults.standard.set(appliedJobsData, forKey: .savedJobsKey)
        showAlert(message: "Job Applied")
    }
    
    //Get details of the saved jobs
    func getSavedJobs() -> [Job]{
        guard let savedJobData = UserDefaults.standard.data(forKey: .savedJobsKey),
              let savedJobs = try? JSONDecoder().decode([Job].self, from: savedJobData) else {
            return []
        }
        return savedJobs
    }
    
    //Check if the job ia already applied
    func isJobAlreadyApplied(_ savedJobs: [Job], job: Job) -> Bool {
        guard !savedJobs.isEmpty else {
            return false
        }
        let isApplied = savedJobs.contains(where: { $0.id == job.id })
        return isApplied
    }
    
    /// To show alert
    /// - Parameter message: The message to be shown
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
    
