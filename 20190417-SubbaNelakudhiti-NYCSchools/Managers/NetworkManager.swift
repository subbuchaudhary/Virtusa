//
//  NetworkManager.swift
//  20190417-SubbaNelakudhiti-NYCSchools
//
//  Created by Subbu Chaudhary on 4/18/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    static let sharedManger = NetworkManager()
    
    private var urlSession  = URLSession()
    
    func fetchData(urlString: String, completion: @escaping (Result<[SchoolsListModel],Error>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        self.urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Oops some error. Try again: ", error!)
                completion(.failure(error!))
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let schoolModel = try JSONDecoder().decode([SchoolsListModel].self, from: data)
                completion(.success(schoolModel))
            } catch let err {
                completion(.failure(err))
            }
        }.resume()
    }
    
    func fetchScoresData(urlString: String, dbn: String, completion: @escaping (Result<[ScoresModel], Error>) -> ()) {
        let path = "\(urlString)?dbn=\(dbn)"
        
        guard let url = URL(string: path) else {
            return
        }
        
        self.urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Oops some error. Try again: ", error!)
                completion(.failure(error!))
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let scoreModel = try JSONDecoder().decode([ScoresModel].self, from: data)
                completion(.success(scoreModel))
            } catch let err {
                completion(.failure(err))
            }
            }.resume()
    }
}
