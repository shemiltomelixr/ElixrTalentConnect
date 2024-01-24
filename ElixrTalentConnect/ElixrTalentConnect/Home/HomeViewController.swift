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
    /// Called when the text in the search bar changes.
    /// - Parameters:
    ///   - searchBar: The search bar object.
    ///   - searchText: The current text entered in the search bar.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            let filteredJobs = viewModel.filterJobs(by: searchText)
            viewModel.updateFilteredJobs(filteredJobs)
            tableView.reloadData()
    }
    /// Returns the number of rows in the table view section based on the current job data.
    /// - Parameters:
    ///   - tableView:  The table view requesting this information.
    ///   - section: The section index of the table view.
    /// - Returns: The number of rows in the section, considering whether a search operation is active.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfJobs(isSearching: !seacrchBarField.text!.isEmpty)
    }
    ///  Configures and returns a cell for a specific row in the table view.
    /// - Parameters:
    ///   - tableView: The table view requesting this information.
    ///   - indexPath: The index path that specifies the location of the row.
    /// - Returns: A configured table view cell representing a job.
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
