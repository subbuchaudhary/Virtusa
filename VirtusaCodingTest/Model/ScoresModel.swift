//
//  ScoresModel.swift
//  VirtusaCodingTest
//
//  Created by Subbu Chaudhary on 4/17/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

struct ScoresModel: Codable {
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
    let school_name: String
}
