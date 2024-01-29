//
//  SideMenuViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 29/01/24.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    var menuContent = ["About Us","Contact Us","Change Password","Privacy Policy","Terms & Conditions"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = menuContent[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
        }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
