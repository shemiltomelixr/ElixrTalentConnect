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
    
    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Configuration
    
    /// Configures the view with job details.
    func configureView() {
        guard let job = job else {
            return
        }
        titleLabel.text = job.title
    }
}
