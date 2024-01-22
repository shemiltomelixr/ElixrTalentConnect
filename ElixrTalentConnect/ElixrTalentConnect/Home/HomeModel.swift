//
//  HomeModel.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 20/01/24.
//

import Foundation

struct JobArray: Decodable {
    var jobs: [Job]
}

struct Job: Decodable {
    let title: String
    let department: String
    let description: String
    let location: String
    let salary: String
    let status: String
    let deadlineDate: String
}
