//
//  News.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import Foundation

struct New: Codable {
    
    var id: String
    var name: String
    var text: String
    var data: String
    
    init (id: String, name: String, text: String, data: String) {
        self.id = id
        self.name = name
        self.text = text
        self.data = data
    }
    
    
}


func loadNews()->[New] {
    var news : [New] = []
    let jsonUrl = "https://www.gennaroamura.it/academy/query/getNews.php"
    
    guard let url = URL(string: jsonUrl) else { return news }
    let request: URLRequest = URLRequest(url: url)
    let session = URLSession.shared
    
    let semaphore = DispatchSemaphore(value: 0)
    session.dataTask(with: request) { (data, response, err) in
        guard let data = data else { return }
        
        do {
            news = try JSONDecoder().decode([New].self, from: data)
        } catch let jsonErr {
            print("Error: ",jsonErr)
        }
        
        semaphore.signal()
        }.resume()
    
    semaphore.wait()
    return news
}

