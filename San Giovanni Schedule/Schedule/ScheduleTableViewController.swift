//
//  ScheduleTableViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
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
    
    override func viewWillAppear(_ animated: Bool) {

        navigationController?.navigationBar.barStyle = .blackTranslucent
        tabBarController?.tabBar.barStyle = .black
        tableView.backgroundColor = UIColor(red:0.14, green:0.15, blue:0.17, alpha:1.0)
        
    
        reloadTable()
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
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.white
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(red:0.99, green:0.37, blue:0.64, alpha:1.0)
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "event", for: indexPath) as? EventTableViewCell  else {
            fatalError("The dequeued cell is not an instance")
        }
        
       
        cell.backgroundColor = UIColor(red:0.12, green:0.12, blue:0.14, alpha:1.0)
        cell.title.textColor = UIColor.white
        cell.subTitle.textColor = UIColor.lightGray
        
        
        
        switch indexPath.section {
        case 0:
            cell.title.text = day1[indexPath.row].name
            cell.subTitle.text = returnSubTitle(events: day1, indexPath: indexPath)
        case 1:
            cell.title.text = day2[indexPath.row].name
            cell.subTitle.text = returnSubTitle(events: day2, indexPath: indexPath)
        case 2:
            cell.title.text = day3[indexPath.row].name
            cell.subTitle.text = returnSubTitle(events: day3, indexPath: indexPath)
        case 3:
            cell.title.text = day4[indexPath.row].name
            cell.subTitle.text = returnSubTitle(events: day4, indexPath: indexPath)
        case 4:
            cell.title.text = day5[indexPath.row].name
            cell.subTitle.text = returnSubTitle(events: day5, indexPath: indexPath)
        default:
            cell.title.text = events[indexPath.row].name
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
    
    @IBAction func segmentFilter(_ sender: Any) {
        reloadTable()
       
    }
    
    func reloadTable() {
        
        
        day1 = []
        day2 = []
        day3 = []
        day4 = []
        day5 = []
        
        for event in events{
            switch segmentControl.selectedSegmentIndex {
            case 0:
                if(event.tag != "Train" && event.tag != "Academy") {
                    
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
            case 1:
                if(event.tag == "Academy"){
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
            default:
                if(event.tag != "Train" ) {
                    
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
            tableView.reloadData()
        }
        
    }
    
    
    func returnSubTitle(events: [Event], indexPath: IndexPath )-> String {
        
        var endingMinute = "00"
        var startingMinute = "00"
        
        if(events[indexPath.row].endingMinute != 0){
            endingMinute = "\(events[indexPath.row].endingMinute)"
        }
        if(events[indexPath.row].startingMinute != 0){
            startingMinute = "\(events[indexPath.row].startingMinute)"
        }
        return "\(events[indexPath.row].tag.uppercased()) | \(events[indexPath.row].location) | \(events[indexPath.row].startingHour):\(startingMinute)- \(events[indexPath.row].endingHour):\(endingMinute)"
    }
    
    
    
}
