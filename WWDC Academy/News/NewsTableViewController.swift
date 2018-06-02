//
//  NewsTableViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news: [New] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        news = loadNews()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as? NewTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        

        
        cell.title.text = news[indexPath.section].name
        cell.data.text = news[indexPath.section].data
        
        cell.textView.text = news[indexPath.section].text
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 240.0;//Choose your custom row height
    }

    

}
