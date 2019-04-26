//
//  DetailsViewController.swift
//  20190417-SubbaNelakudhiti-NYCSchools
//
//  Created by Subbu Chaudhary on 4/18/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var readingScoreVal: UILabel!
    @IBOutlet weak var writingScoreVal: UILabel!
    @IBOutlet weak var mathScoreVal: UILabel!
    var dbn: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchScores()
        // Do any additional setup after loading the view.
    }
    
    func fetchScores() {
        NetworkManager.sharedManger.fetchScoresData(urlString: Constants.kScoresApi, dbn: dbn) { (res) in
            switch res {
                case .success(let response):
                    DispatchQueue.main.async {
                    if let object = response.first {
                        self.readingScoreVal.text = object.sat_critical_reading_avg_score
                        self.writingScoreVal.text = object.sat_writing_avg_score
                        self.mathScoreVal.text = object.sat_math_avg_score
                    } else {
                        self.readingScoreVal.text = "No score Avalable"
                        self.writingScoreVal.text = "No score Avalable"
                        self.mathScoreVal.text = "No score Avalable"
                    }
                }
            case .failure( _):
                DispatchQueue.main.async {
                self.readingScoreVal.text = "--"
                self.writingScoreVal.text = "--"
                self.mathScoreVal.text = "--"
                }
            }
        }
    }
    
}
