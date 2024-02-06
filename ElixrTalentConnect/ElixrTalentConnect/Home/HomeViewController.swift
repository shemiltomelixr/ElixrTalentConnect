//
//  HomeViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 16/01/24.
//

import UIKit

/// A view controller responsible for displaying a list of jobs and allowing users to search and view job details.
class HomeViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var seacrchBarField: UISearchBar!
    
    //To creeate an instance of viewmodel
    var viewModel = HomeViewModel()
    
    // MARK: -ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seacrchBarField.delegate = self
        viewModel.fetchJobData { [weak self] (jobArray, error) in
            guard let self = self, let jobs = jobArray?.jobs else { return }
            DispatchQueue.main.async {
                self.viewModel.updateJobs(jobs)
                self.tableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
  
    
    // MARK: - UITableViewDelegate
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchTextIsEmpty = seacrchBarField.text?.isEmpty ?? true
                    let selectedJob = viewModel.job(at: indexPath.row, isSearching: !searchTextIsEmpty)
                    showJobDetailsViewController(for: selectedJob)
        }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let searchText = seacrchBarField.text {
            return viewModel.numberOfJobs(isSearching: !searchText.isEmpty)
        } else {
            return viewModel.numberOfJobs(isSearching: false)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as? HomeTableViewCell else{
            return UITableViewCell()
        }
        let searchText = seacrchBarField.text ?? ""
        let job = viewModel.job(at: indexPath.row, isSearching: !searchText.isEmpty)
        cell.configureCell(job)
        cell.viewModel.jobId = job.id
        cell.updateWishlistButtonAppearance()
        return cell
    }
    
    // MARK: - Navigation
        
    /// Navigates to the job details view controller for the selected job.
    /// - Parameter job: The selected job.
    func showJobDetailsViewController(for job: Job) {
        guard let jobDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "JobDetailsViewController") as? JobDetailsViewController else {
               return
           }
           jobDetailsViewController.job = job
           navigationController?.pushViewController(jobDetailsViewController, animated: true)
       }
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            let filteredJobs = viewModel.filterJobs(by: searchText)
            viewModel.updateFilteredJobs(filteredJobs)
            tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
