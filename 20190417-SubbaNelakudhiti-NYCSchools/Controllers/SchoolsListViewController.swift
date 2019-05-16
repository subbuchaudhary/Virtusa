//
//  SchoolsListViewController.swift
//  20190417-SubbaNelakudhiti-NYCSchools
//
//  Created by Subbu Chaudhary on 4/18/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class SchoolsListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var schoolsList : [SchoolsListModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchSchools()
    }
    
    func fetchSchools() {
        NetworkManager.sharedManger.fetchData(urlString: Constants.kSchoolsApi) { (result) in
            if case .success(let response) = result {
                DispatchQueue.global(qos: .userInitiated).async {
                    self.schoolsList = response
                    DispatchQueue.main.async {
                        self.tblView.reloadData()
                    }
                }
            } else {
                DispatchQueue.global(qos: .userInitiated).async {
                    self.schoolsList.removeAll()
                    DispatchQueue.main.async {
                        self.tblView.reloadData()
                    }
                }
            }
        }
    }
}

class HighSchoolsCell: UITableViewCell {
    @IBOutlet weak var schoolName: UILabel?
}
