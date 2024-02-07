//
//  SideMenuViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 29/01/24.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menuContent = ["About Us","Contact Us","Change Password","Privacy Policy","Terms & Conditions"]
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
    }
    
    // MARK: -UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = menuContent[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
        }
   
  
}
