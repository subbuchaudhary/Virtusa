//
//  SchoolsListViewController+.swift
//  20190417-SubbaNelakudhiti-NYCSchools
//
//  Created by Subbu Chaudhary on 5/16/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

extension SchoolsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolmodel = self.schoolsList[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.navigationItem.title = "Score Details"
        vc.dbn = schoolmodel.dbn
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SchoolsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (schoolsList.count > 0 ) ? schoolsList.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HighSchoolsCell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolsCell") as! HighSchoolsCell
        let schoolObj = schoolsList[indexPath.row]
        cell.schoolName?.text =  schoolObj.school_name
        
        return cell
    }
    
}
