//
//  HomeViewModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 20/01/24.
//

import Foundation

class HomeViewModel {
    private var jobs: [Job] = []
    private var filteredJobs: [Job] = []
    
    func fetchJobData(completion: @escaping (JobArray?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:9001/elixr/jobs") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let jobData = try decoder.decode(JobArray.self, from: data)
                    //self.jobs = jobData["jobs"] ?? []
                    completion(jobData, nil)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    func numberOfJobs() -> Int {
        return jobs.count
    }
    
    func job(at index: Int) -> Job {
        return jobs[index]
    }
    
    func updateJobs(_ job: [Job]) {
        jobs = job
    }
    
    func filterJobs(by searchText: String) -> [Job] {
        if searchText.isEmpty {
            return jobs
        } else {
            return jobs.filter { $0.title.lowercased().contains(searchText.lowercased()) }
            }
        }
    func updateFilteredJobs(_ jobs: [Job]) {
            filteredJobs = jobs
        }
    func numberOfJobs(isSearching: Bool) -> Int {
           return isSearching ? filteredJobs.count : jobs.count
       }
    func job(at index: Int, isSearching: Bool) -> Job {
           return isSearching ? filteredJobs[index] : jobs[index]
       }
    
}
