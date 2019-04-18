//
//  DetailsViewController.swift
//  VirtusaCodingTest
//
//  Created by Subbu Chaudhary on 4/18/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var readingScoreVal: UILabel!
    @IBOutlet weak var writingScoreVal: UILabel!
    @IBOutlet weak var mathScoreVal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchScores()
        // Do any additional setup after loading the view.
    }
    
    func fetchScores() {
        NetworkManager.sharedNetworkManager.fetchData(urlString: Constants.kScoresApi) { (error, response, isSuccess) in
            if isSuccess {
                self.readingScoreVal.text = ""
                self.writingScoreVal.text = ""
                self.mathScoreVal.text = ""
            } else {
                self.readingScoreVal.text = "--"
                self.writingScoreVal.text = "--"
                self.mathScoreVal.text = "--"
            }
        }
    }

}
