//
//  HomeViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 16/01/24.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var seacrchBarField: UISearchBar!
    
    var viewModel = HomeViewModel()
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            let filteredJobs = viewModel.filterJobs(by: searchText)
            viewModel.updateFilteredJobs(filteredJobs)
            tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfJobs(isSearching: !seacrchBarField.text!.isEmpty)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as? HomeTableViewCell else{
            return UITableViewCell()
        }
        let job = viewModel.job(at: indexPath.row, isSearching: !seacrchBarField.text!.isEmpty)
        cell.configureCell(job)
        return cell
    }
    
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
   
    
}
