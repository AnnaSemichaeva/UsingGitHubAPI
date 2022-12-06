//
//  NetworkingHelpers.swift
//  UsingGitHubAPI
//
//  Created by macuser on 12/5/22.
//

import Foundation

class NetworkingHelpers {
    
    static func loadData(url: URL, completion: (([Repository])->Void)?) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data, let response = response, error == nil {
                if let decodedData = try? JSONDecoder().decode([Repository].self, from: data) {
                    completion?(decodedData)
                }
            }
        }
        task.resume()
    }
}
