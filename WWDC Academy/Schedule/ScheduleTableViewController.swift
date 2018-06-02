//
//  ScheduleTableViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    
    var events: [Event] = []
    var day1: [Event] = []
    var day2: [Event] = []
    var day3: [Event] = []
    var day4: [Event] = []
    var day5: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = loadEvents()
        
        for event in events {
            if(event.tag != "Train"){
                switch event.day {
                case 0:
                    day1.append(event)
                case 1:
                    day2.append(event)
                case 2:
                    day3.append(event)
                case 3:
                    day4.append(event)
                case 4:
                    day5.append(event)
                default:
                    day1.append(event)
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section {
        case 0:
            return day1.count
        case 1:
            return day2.count
        case 2:
            return day3.count
        case 3:
            return day4.count
        case 4:
            return day5.count
        default:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        switch section {
        case 0:
            return "4 June"
        case 1:
            return "5 June"
        case 2:
            return "6 June"
        case 3:
            return "7 June"
        case 4:
            return "8 June"
        default:
            return "4 June"
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "event", for: indexPath) as? EventTableViewCell  else {
            fatalError("The dequeued cell is not an instance")
        }
        switch indexPath.section {
        case 0:
            cell.title.text = day1[indexPath.row].name
            if((day1[indexPath.row].startingMinute) == 0) {
                cell.subTitle.text = "\(day1[indexPath.row].location) | \(day1[indexPath.row].startingHour):00 - \(day1[indexPath.row].ending)"
            } else {
                cell.subTitle.text = "\(day1[indexPath.row].location) | \(day1[indexPath.row].startingHour):\(day1[indexPath.row].startingMinute)- \(day1[indexPath.row].ending)"
            }
        case 1:
            cell.title.text = day2[indexPath.row].name
            if((day2[indexPath.row].startingMinute) == 0) {
                cell.subTitle.text = "\(day2[indexPath.row].location) | \(day2[indexPath.row].startingHour):00 - \(day2[indexPath.row].ending)"
            } else {
                cell.subTitle.text = "\(day2[indexPath.row].location) | \(day2[indexPath.row].startingHour):\(day2[indexPath.row].startingMinute)- \(day2[indexPath.row].ending)"
            }
        case 2:
            cell.title.text = day3[indexPath.row].name
            if((day3[indexPath.row].startingMinute) == 0) {
                cell.subTitle.text = "\(day3[indexPath.row].location) | \(day3[indexPath.row].startingHour):00 - \(day3[indexPath.row].ending)"
            } else {
                cell.subTitle.text = "\(day3[indexPath.row].location) | \(day3[indexPath.row].startingHour):\(day3[indexPath.row].startingMinute)- \(day3[indexPath.row].ending)"
            }
        case 3:
            cell.title.text = day4[indexPath.row].name
            if((day4[indexPath.row].startingMinute) == 0) {
                cell.subTitle.text = "\(day4[indexPath.row].location) | \(day4[indexPath.row].startingHour):00 - \(day4[indexPath.row].ending)"
            } else {
                cell.subTitle.text = "\(day4[indexPath.row].location) | \(day4[indexPath.row].startingHour):\(day4[indexPath.row].startingMinute)- \(day4[indexPath.row].ending)"
            }
        case 4:
            cell.title.text = day5[indexPath.row].name
            if((day4[indexPath.row].startingMinute) == 0) {
                cell.subTitle.text = "\(day5[indexPath.row].location) | \(day5[indexPath.row].startingHour):00 - \(day4[indexPath.row].ending)"
            } else {
                cell.subTitle.text = "\(day5[indexPath.row].location) | \(day5[indexPath.row].startingHour):\(day5[indexPath.row].startingMinute)- \(day5[indexPath.row].ending)"
            }
        default:
            cell.title.text = events[indexPath.row].name
            if((events[indexPath.row].startingMinute) == 0) {
                cell.subTitle.text = "\(events[indexPath.row].location) | \(events[indexPath.row].startingHour):00 - \(events[indexPath.row].ending)"
            } else {
                cell.subTitle.text = "\(events[indexPath.row].startingHour):\(events[indexPath.row].startingMinute)- \(events[indexPath.row].ending)"
            }
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let controller = segue.destination as! DetailViewController
            controller.events = sender as! Event
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "detail", sender: day1[indexPath.row])
        case 1:
            performSegue(withIdentifier: "detail", sender: day2[indexPath.row])
        case 2:
            performSegue(withIdentifier: "detail", sender: day3[indexPath.row])
        case 3:
            performSegue(withIdentifier: "detail", sender: day4[indexPath.row])
        case 4:
            performSegue(withIdentifier: "detail", sender: day5[indexPath.row])
        default:
            performSegue(withIdentifier: "detail", sender: day1[indexPath.row])
        }
        
    }
    
    @IBAction func addPressedButton(_ sender: Any) {
        
        let fbURLWeb = URL(string: "https://www.facebook.com/groups/developeracademy2017/permalink/2060636307595820/")!
        
        if(UIApplication.shared.canOpenURL(fbURLWeb )){
            // FB installed
            UIApplication.shared.open(fbURLWeb, options: [:])
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(fbURLWeb, options: [:])
        }
        
    }
    
    
}
