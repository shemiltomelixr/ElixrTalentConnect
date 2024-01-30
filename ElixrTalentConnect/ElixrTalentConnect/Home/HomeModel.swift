//
//  HomeModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 20/01/24.
//

import Foundation

///Collection of jobs retrieved from the api.
struct JobArray: Decodable {
    /// An array of individual job entries.
    var jobs: [Job]
}

/// Represents a single job with its details.
struct Job: Decodable {
    let id: String
    let title: String
    let department: String
    let description: String
    let location: String
    let salary: String
    let status: String
    let deadlineDate: String
}
