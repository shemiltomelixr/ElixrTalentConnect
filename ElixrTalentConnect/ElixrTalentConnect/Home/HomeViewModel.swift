//
//  HomeViewModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 20/01/24.
//

import Foundation

class HomeViewModel {
    private var jobs: [Job] = []
    
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
}
