//
//  HomeViewModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 20/01/24.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    /// Store all jobs retrieved
    private var jobs: [Job] = []
    /// Store jobs that match the current search text.
    private var filteredJobs: [Job] = []
    /// Representing Id of the job
    var jobId: String?
    
    // MARK: - Networking
    
    /// Fetch job data from the api
    /// - Parameter completion: A closure called upon completion of the data fetch, providing either the job data or an error.
    func fetchJobData(completion: @escaping (JobArray?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:9001/elixr/jobs") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let jobData = try decoder.decode(JobArray.self, from: data)
                    completion(jobData, nil)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    // MARK: - Data Manipulation

    /// Updates the list of all jobs with the provided array.
    /// - Parameter job: The new array of jobs to replace the existing list.
    func updateJobs(_ job: [Job]) {
        jobs = job
    }
    
    /// Updates the list of filtered jobs based on the search text.
    /// - Parameter searchText: The text used for filtering jobs.
    /// - Returns: An array of jobs that match the search text.
    func filterJobs(by searchText: String) -> [Job] {
        if searchText.isEmpty {
            return jobs
        } else {
            return jobs.filter { $0.title.lowercased().contains(searchText.lowercased()) }
            }
    }
    
    /// Updates the list of filtered jobs
    /// - Parameter jobs: The list of jobs to set as filtered jobs.
    func updateFilteredJobs(_ jobs: [Job]) {
            filteredJobs = jobs
    }
    
    /// Returns the total number of jobs, considering whether a search operation is active.
    /// - Parameter isSearching: whether a search operation is active.
    /// - Returns: The total number of jobs. If searching, returns the count of filtered jobs; otherwise, returns the count of all jobs.
    func numberOfJobs(isSearching: Bool) -> Int {
           return isSearching ? filteredJobs.count : jobs.count
    }
    
    /// Returns the job at the specified index, considering whether a search operation is active.
    /// - Parameters:
    ///   - index:  The index of the job to retrieve.
    ///   - isSearching: Whether a search operation is active.
    /// - Returns: The job at the specified index. If searching, returns the job from the filtered list; otherwise, returns the job from the complete list.
    func job(at index: Int, isSearching: Bool) -> Job {
           return isSearching ? filteredJobs[index] : jobs[index]
       }
    
    // MARK: - Date Formatting
    
    /// Formats a date string into a custom format
    /// - Parameter dateString: The date string to be formatted.
    /// - Returns: The formatted date string or nil if the date string is not in the expected format.
    func formatDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "d"
            let day = dayFormatter.string(from: date)
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "MMM"
            let month = monthFormatter.string(from: date)
            let yearFormatter = DateFormatter()
            yearFormatter.dateFormat = "yyyy"
            let year = yearFormatter.string(from: date)
            return "\(day)\(daySuffix(day)) \(month) \(year)"
        } else {
            return nil
        }
    }
    
    /// Adds the appropriate suffix to the provided day.
    /// - Parameter day: The day as a string.
    /// - Returns:  The suffix corresponding to the provided day.
    func daySuffix(_ day: String) -> String {
        let dayInt = Int(day) ?? 0
        switch dayInt {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
    
    // MARK: - Wishlist
    
    /// Toggles the wishlist status of a job.
    func wishList() {
        guard let jobUniqueId = jobId else { return }
        let isWishlist = UserDefaults.standard.bool(forKey: jobUniqueId)
        UserDefaults.standard.set(!isWishlist, forKey: jobUniqueId)
    }
}
