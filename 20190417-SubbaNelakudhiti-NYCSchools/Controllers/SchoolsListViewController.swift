//
//  SchoolsListViewController.swift
//  20190417-SubbaNelakudhiti-NYCSchools
//
//  Created by Subbu Chaudhary on 4/18/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class SchoolsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        let schoolmodel = self.schoolsList[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.navigationItem.title = "Score Details"
        vc.dbn = schoolmodel.dbn
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchSchools() {
        NetworkManager.sharedManger.fetchData(urlString: Constants.kSchoolsApi) { (res) in
            switch res {
            case .success(let response):
                self.schoolsList = response
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            case .failure( _):
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
