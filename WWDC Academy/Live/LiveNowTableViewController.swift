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
    var timer: Timer!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        events = loadEvents()
        let todayDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        guard let dayWeek = calendar?.component(.weekday, from: todayDate as Date) else { return }
        let day = dayWeek - 6
        let hour = calendar?.component(.hour, from: todayDate as Date)
        for event in events {
            if(event.day == day && event.startingHour >= hour! ) {
                dayEvents.append(event)
            }
        }
        print("DayWWDC",day)
        self.title = "Live"
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(reCheck), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reCheck()
    }
    
    @objc func reCheck() {
        
        dayEvents = []
        
        let todayDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        guard let dayWeek = calendar?.component(.weekday, from: todayDate as Date) else { return }
        let day = dayWeek - 6
        
        let hour = calendar?.component(.hour, from: todayDate as Date)
        
        for event in events {
            if(event.day == day && event.startingHour >= hour! ) {
                dayEvents.append(event)
                print(event)
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

        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dayEvents.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let todayDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        guard let dayWeek = calendar?.component(.weekday, from: todayDate as Date) else { return "No WWDC day" }
        let day = dayWeek - 6

        switch day {
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
            return "No WWDC day"
        }
    }
    
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "livenow", for: indexPath) as? LiveNowTableViewCell  else {
            fatalError("The dequeued cell is not an instance")
        }
        let todayDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let hour = calendar?.component(.hour, from: todayDate as Date)
        let minute = calendar?.component(.minute, from: todayDate as Date)

        if(dayEvents[indexPath.row].startingHour == hour) {
            if(dayEvents[indexPath.row].startingMinute == minute! ||  dayEvents[indexPath.row].startingMinute < minute!) {
                cell.subTitle.text = "Live Now | \(dayEvents[indexPath.row].location)"
                cell.title.text = dayEvents[indexPath.row].name
            }
        } else {
            if( dayEvents[indexPath.row].startingMinute == 0) {
                cell.subTitle.text = "\(dayEvents[indexPath.row].startingHour):00 | \(dayEvents[indexPath.row].location)"
                cell.title.text = dayEvents[indexPath.row].name
            }else{
                cell.subTitle.text = "\(dayEvents[indexPath.row].startingHour):\(dayEvents[indexPath.row].startingMinute) | \(dayEvents[indexPath.row].location)"
                cell.title.text = dayEvents[indexPath.row].name
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
        
        performSegue(withIdentifier: "detail", sender: dayEvents[indexPath.row])
        
    }
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
     
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
     
    */

    /*
    // Override to support editing the table view.
     
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
     
    }
    */

    /*
    // Override to support rearranging the table view.
     
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
     
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
     
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
