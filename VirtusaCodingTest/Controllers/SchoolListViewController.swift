//
//  SchoolListViewController.swift
//  VirtusaCodingTest
//
//  Created by Subbu Chaudhary on 4/17/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class SchoolListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    var schoolsList : [SchoolsListModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchSchools()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  (schoolsList.count > 0 ) ? schoolsList.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HighSchoolsCell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolsCell") as! HighSchoolsCell
        let schoolObj = schoolsList[indexPath.row]
        cell.schoolName?.text =  schoolObj.school_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.navigationItem.title = "Scores Details"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchSchools() {
        NetworkManager.sharedNetworkManager.fetchData(urlString: Constants.kSchoolsApi) { (error, response, isSuccess) in
            if isSuccess {
                self.schoolsList = try JSONDecoder.decode(response) ?? []
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            } else {
                self.schoolsList.removeAll()
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
        }
    }
}

class HighSchoolsCell: UITableViewCell {
    @IBOutlet weak var schoolName: UILabel?
}

