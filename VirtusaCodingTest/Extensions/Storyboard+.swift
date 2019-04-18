//
//  Storyboard+.swift
//  VirtusaCodingTest
//
//  Created by Subbu Chaudhary on 4/17/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    class func storyboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: Bundle.main)
    }
    
    class func storyboard(name: String, bundleIdentifier: String) -> UIStoryboard? {
        
        if let bundle = Bundle(identifier: bundleIdentifier) {
            return UIStoryboard(name: name, bundle: bundle)
        }
        return nil
    }
}
