//
//  MyJobViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 05/02/24.
//

import UIKit

class MyJobViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var savedJobs: [Job] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarField: UISearchBar!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedJobs.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyJobCell", for: indexPath) as? MyJobTableViewCell else {
            return UITableViewCell()
        }
        let job = savedJobs[indexPath.row]
        cell.configureCell(job)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarField.delegate = self
        savedJobs = getSavedJobs()
        tableView.reloadData()

    }
   override func viewWillAppear(_ animated: Bool) {
       savedJobs = getSavedJobs()
       tableView.reloadData()
    
   }
     
    func getSavedJobs() -> [Job] {
           guard let savedJobData = UserDefaults.standard.data(forKey: .savedJobsKey),
                 let savedJobs = try? JSONDecoder().decode([Job].self, from: savedJobData) else {
               return []
           }
           return savedJobs
       }
}

// MARK: - UISearchBarDelegate

extension MyJobViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
