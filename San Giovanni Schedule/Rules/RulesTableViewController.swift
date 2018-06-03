//
//  RulesTableViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class RulesTableViewController: UITableViewController {
    
    var rules1: [Rule] = []
    var rules2: [Rule] = []
    var rules3: [Rule] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        rules1 = [Rule(name: "Use of spaces",  text: "Lab 1 is reserved as a quiet space, please avoid disruptions")]
        rules2 = [Rule(name: "Food and Drinks", text: "No food or drinks are allowed in the Seminar.") , Rule(name: "Food and Drinks", text: "Handling of food and drinks is limited to the Kitchen.") , Rule(name: "Food and Drinks", text: "As always, tidy up every space, leave it better than you found it.") , Rule(name: "Don’t have open containers close to the sofas to prevent spillages.", text: "Don’t have open containers close to the sofas to prevent spillages.")]
        rules3 = [Rule(name: "Security", text: "After 7pm we only leave the academy in groups of 5 or more people, the more the merrier. \nGroups gather at the welcome desk 15 minutes before each train’s departure time.\nTrain departure timetables are available in Collab 1")]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            
            return 1
        case 1:
            
            return rules2.count
        case 2:
            
            return rules3.count
        default:
            return 0
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "rule", for: indexPath) as? RuleTableViewCell  else {
            fatalError("The dequeued cell is not an instance.")
        }
        
        switch indexPath.section {
        case 0:
            cell.textRules.text = rules1[indexPath.row].text
        case 1:
            cell.textRules.text = rules2[indexPath.row].text
        case 2:
            cell.textRules.text = rules3[indexPath.row].text
        default:
            cell.textRules.text = rules1[indexPath.row].text
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0;
    }

     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            
            return rules1.first?.name
        case 1:
            
            return rules2.first?.name
        case 2:
            
            return rules3.first?.name
        default:
            return rules1.first?.name
        }
    }

}
