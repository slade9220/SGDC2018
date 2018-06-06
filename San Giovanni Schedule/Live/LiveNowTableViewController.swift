//
//  LiveNowTableViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class LiveNowTableViewController: UITableViewController {
    
    var events: [Event] = []
    var dayEvents: [Event] = []
    var liveEvents: [Event] = []
    var nextEvents: [Event] = []
    var timer: Timer!
    

    override func viewDidLoad() {
        super.viewDidLoad()

         self.title = "Live"
        events = loadEvents()
        
        let todayDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        guard let dayWeek = calendar?.component(.weekday, from: todayDate as Date) else { return }
        let day = dayWeek - 2
        let weekOfYear = calendar?.component(.weekOfYear, from: todayDate as Date)
        if(weekOfYear == 23 ) {
            let hour = calendar?.component(.hour, from: todayDate as Date)
            let minute = calendar?.component(.minute, from: todayDate as Date)
            for event in events {
                if(event.tag != "Train") {
                    if(event.day == day && event.endingHour >= hour! ) {
                        if(event.endingHour == hour!) {
                            if(event.endingMinute >= minute!) {
                                dayEvents.append(event)
                            }
                        } else {
                            dayEvents.append(event)
                        }
                        
                        
                    }
                }
            }
            
            for event in dayEvents {
                if(event.startingHour <= hour!) {
                    if(event.startingMinute <= minute! &&  event.startingHour == hour!) {
                        liveEvents.append(event)
                        
                    } else{
                        liveEvents.append(event)
                    }
                } else {
                    
                    nextEvents.append(event)
                }
            }
            timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(reCheck), userInfo: nil, repeats: true)
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(reCheck), userInfo: nil, repeats: true)
        let todayDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let weekOfYear = calendar?.component(.weekOfYear, from: todayDate as Date)
        if(weekOfYear == 23 ) {
            
            reCheck()
        }
        navigationController?.navigationBar.barStyle = .blackTranslucent
        tabBarController?.tabBar.barStyle = .black
        tableView.backgroundColor = UIColor(red:0.14, green:0.15, blue:0.17, alpha:1.0)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    
    @objc func reCheck() {
        
        dayEvents = []
        liveEvents = []
        nextEvents = []

        let todayDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        guard let dayWeek = calendar?.component(.weekday, from: todayDate as Date) else { return }
        let day = dayWeek - 2
        let weekOfYear = calendar?.component(.weekOfYear, from: todayDate as Date)
        if(weekOfYear == 23 ) {
            let hour = calendar?.component(.hour, from: todayDate as Date)
            let minute = calendar?.component(.minute, from: todayDate as Date)
            
            for event in events {
                if(event.tag != "Train") {
                    if(event.day == day && event.endingHour >= hour! ) {
                        if(event.endingHour == hour!) {
                            if(event.endingMinute >= minute!) {
                                dayEvents.append(event)
                            }
                        } else {
                            dayEvents.append(event)
                        }
                        
                        
                    }
                }
            }
            
            for event in dayEvents {
                if(event.startingHour <= hour!) {
                    if(event.startingMinute <= minute! &&  event.startingHour == hour!) {
                        liveEvents.append(event)
                        
                    } else{
                        liveEvents.append(event)
                    }
                } else {
                    
                    nextEvents.append(event)
                }
            }
        }

        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        if(liveEvents.count > 0) {
            return 2
        } else {
            return 1
        }
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(liveEvents.count > 0) {
            if(section == 0){
                return liveEvents.count
            } else {
                return nextEvents.count
            }
        } else {
            return nextEvents.count
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(liveEvents.count > 0) {
            if(section == 0){
                return "Live Now"
            } else {
                return "Next Event"
            }
        } else {
            return "Next Event"
        }
        
    }
    
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "livenow", for: indexPath) as? LiveNowTableViewCell  else {
            fatalError("The dequeued cell is not an instance")
        }

        cell.backgroundColor = UIColor(red:0.12, green:0.12, blue:0.14, alpha:1.0)
        cell.title.textColor = UIColor.white
        cell.subTitle.textColor = UIColor.lightGray
        
        if(liveEvents.count > 0) {
            
            if(indexPath.section == 0) {
                cell.subTitle.textColor = UIColor.green
                cell.title.text = liveEvents[indexPath.row].name
                cell.subTitle.text = "Live Now |\(liveEvents[indexPath.row].tag.uppercased()) | \(liveEvents[indexPath.row].location) "
            }
            if(indexPath.section == 1) {
                cell.subTitle.textColor = UIColor.lightGray
                if( nextEvents[indexPath.row].startingMinute == 0) {
                    cell.subTitle.text = "\(nextEvents[indexPath.row].tag.uppercased()) | \(nextEvents[indexPath.row].startingHour):00 | \(nextEvents[indexPath.row].location)"
                    cell.title.text = nextEvents[indexPath.row].name
                } else{
                    cell.subTitle.text = "\(nextEvents[indexPath.row].tag.uppercased()) | \(nextEvents[indexPath.row].startingHour):\(nextEvents[indexPath.row].startingMinute) | \(nextEvents[indexPath.row].location)"
                    cell.title.text = nextEvents[indexPath.row].name
                }
            }
            
        } else {
            
                cell.subTitle.textColor = UIColor.lightGray
                if( nextEvents[indexPath.row].startingMinute == 0) {
                    cell.subTitle.text = "\(nextEvents[indexPath.row].tag.uppercased()) | \(nextEvents[indexPath.row].startingHour):00 | \(nextEvents[indexPath.row].location)"
                    cell.title.text = nextEvents[indexPath.row].name
                } else{
                    cell.subTitle.text = "\(nextEvents[indexPath.row].tag.uppercased()) | \(nextEvents[indexPath.row].startingHour):\(nextEvents[indexPath.row].startingMinute) | \(nextEvents[indexPath.row].location)"
                    cell.title.text = nextEvents[indexPath.row].name
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
        
        if (liveEvents.count > 0 ){
            if(indexPath.section == 0){
                performSegue(withIdentifier: "detail", sender: liveEvents[indexPath.row])
            } else {
                performSegue(withIdentifier: "detail", sender: nextEvents[indexPath.row])
            }
        } else {
            performSegue(withIdentifier: "detail", sender: nextEvents[indexPath.row])
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.white
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(red:0.99, green:0.37, blue:0.64, alpha:1.0)
    }
    
    
}
