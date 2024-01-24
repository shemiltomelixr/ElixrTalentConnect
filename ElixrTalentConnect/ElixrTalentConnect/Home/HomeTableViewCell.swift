//
//  HomeTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 21/01/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var deadLineLabel: UILabel!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var jobDetailsView: UIView!
    @IBOutlet weak var wishList: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homedesign()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    /// Configures the cell with the provided job data
    /// - Parameter job: The job object containing data to be displayed in the cell.
    func configureCell(_ job: Job) {
        titleLabel.text = job.title
        descriptionLabel.text = job.description
        locationLabel.text = job.location
        // Format the deadlineDate
        if let formattedDate = formatDate(job.deadlineDate) {
            deadLineLabel.text = formattedDate
        } else {
            deadLineLabel.text = "Invalid Date"
        }
    }
    /// Formats a date string into a custom format
    /// - Parameter dateString: The date string to be formatted.
    /// - Returns: The formatted date string or nil if the date string is not in the expected format.
    private func formatDate(_ dateString: String) -> String? {
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
    private func daySuffix(_ day: String) -> String {
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
    ///  Applies custom design to the UI elements of the cell.
    func homedesign(){
        dateView.layer.cornerRadius = 5
        jobDetailsView.layer.cornerRadius = 10
    }
   

}
