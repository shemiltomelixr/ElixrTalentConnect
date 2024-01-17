//
//  SignUpViewController.swift
//  ElixrTalentConnect
//
//  Created by Shemil Tom on 15/01/24.
//

import UIKit

class SignUpViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    let datas: [SignUpModel] = [.fullName, .emailAddress, .textPassword , .confirmPassword]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SignUPTableViewCell else {
            return UITableViewCell()
        }
        let data = datas[indexPath.row]
        cell.CellLabel.text = data.label
        return cell
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
