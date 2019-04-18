//
//  NetworkManager.swift
//  VirtusaCodingTest
//
//  Created by Subbu Chaudhary on 4/17/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    static let sharedNetworkManager = NetworkManager()
    
    private var urlSession  = URLSession()
    
    func fetchData(urlString: String, completion: @escaping (_ error: Error?, _ list: [SchoolsListModel]?, _ sccuss: Bool) -> Void) -> Void {
        guard let url = URL(string: urlString) else {
            completion(nil, nil, false)
            return
        }
        let urlRequest = URLRequest(url: url)
        self.urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                print("Oops some error.Try again: ", error!)
                completion(error , nil , false)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let schoolModel = try JSONDecoder().decode([SchoolsListModel].self, from: data)
                completion(nil, schoolModel, false)
            } catch let err {
                completion(err, nil, false)
            }
        }.resume()
    }
}
