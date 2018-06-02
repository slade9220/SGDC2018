//
//  Rules.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import Foundation

struct Rule: Codable {
    var id: Int
    var text: String
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
}

func loadRules()->[Rule] {
    
    var rules : [Rule] = []
    let jsonUrl = "https://www.gennaroamura.it/academy/query/getRules.php"
    
    guard let url = URL(string: jsonUrl) else { return rules }
    let request: URLRequest = URLRequest(url: url)
    let session = URLSession.shared
    
    let semaphore = DispatchSemaphore(value: 0)
    session.dataTask(with: request) { (data, response, err) in
        guard let data = data else { return }
        
        do {
            rules = try JSONDecoder().decode([Rule].self, from: data)
        } catch let jsonErr {
            print("Error: ",jsonErr)
        }
        
        semaphore.signal()
        }.resume()
    
    semaphore.wait()
    
    return rules
}
