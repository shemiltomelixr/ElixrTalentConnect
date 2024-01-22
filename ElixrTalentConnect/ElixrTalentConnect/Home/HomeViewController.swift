//
//  HomeViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 16/01/24.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
 
    var viewModel = HomeViewModel()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfJobs()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as? HomeTableViewCell else{
            return UITableViewCell()
        }
              
              let job = viewModel.job(at: indexPath.row)
//              cell.titleLabel.text = job.title
//              //cell.departmentLabel.text = job.department
//              cell.descriptionLabel.text = job.description
//              cell.locationLabel.text = job.location
//              cell.deadLineLabel.text = job.deadlineDate
//        
              //cell.salaryLabel.text = job.salary
              //cell.statusLabel.text = job.status
        cell.configureCell(job)
              
              return cell
    }
    
    
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.fetchJobData { [weak self] (jobArray, error) in
            guard let self = self, let jobs = jobArray?.jobs else { return }
            
            DispatchQueue.main.async {
                self.viewModel.updateJobs(jobs)
                self.tableView.reloadData()
            }
        }
    }
    
    
}
