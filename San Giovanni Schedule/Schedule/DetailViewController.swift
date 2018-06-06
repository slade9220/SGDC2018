//
//  DetailViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit
import UserNotifications

class DetailViewController: UIViewController {
    
    
    var events = Event()
    var isNotification = false
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var tag: UILabel!
    @IBOutlet weak var location: UIImageView!
    @IBOutlet weak var descText: UITextView!
    
    @IBOutlet weak var notButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        name.text = events.name
        //        self.title = events.name
        var startingMinute = "00"
        var endingMinute = "00"
        descText.isHidden = true
        
        if(events.startingMinute != 0) {
            startingMinute = "\(events.startingMinute)"
        }
        if(events.endingMinute != 0) {
            endingMinute = "\(events.endingMinute)"
        }
        
        switch events.day {
        case 0:
            
            data.text =  "\(events.location) | 4 June \(events.startingHour):\(startingMinute) - \(events.endingHour):\(endingMinute)"
        case 1:
            
            data.text = "\(events.location) | 5 June \(events.startingHour):\(startingMinute) - \(events.endingHour):\(endingMinute)"
        case 2:
            
            data.text = "\(events.location) | 6 June \(events.startingHour):\(startingMinute) - \(events.endingHour):\(endingMinute)"
        case 3:
            
            data.text = "\(events.location) | 7 June \(events.startingHour):\(startingMinute) - \(events.endingHour):\(endingMinute)"
        case 4:
            data.text = "\(events.location) | 8 June \(events.startingHour):00 - \(events.endingHour):\(endingMinute)"
        default:
            data.text = "4 June"
        }
        
        tag.text = events.tag.uppercased()
        location.image = UIImage(named: events.location)
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
            for request in requests{
                if(request.identifier == "\(self.events.id)" ) {
                    self.notButton.image = UIImage(named: "cancel")
                    self.isNotification = true
                }
            }
        }
        
        view.backgroundColor = UIColor(red:0.12, green:0.12, blue:0.14, alpha:1.0)
        name.textColor = UIColor.white
        data.textColor = UIColor.lightGray
        tag.textColor = UIColor(red:0.99, green:0.37, blue:0.64, alpha:1.0)
    }
    
    
    @IBAction func notificationPressed(_ sender: Any) {
        
        if(isNotification) {
             UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(events.id)"])
            self.notButton.image = UIImage(named: "bell")
            isNotification = false
        } else {

            let content = UNMutableNotificationContent()
            content.title = "Event starts now!"
            content.body = events.name
            content.sound = UNNotificationSound.default()
            
            
            let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
            let dayWeek = events.day + 2

            
            let dateComponent = DateComponents(calendar: calendar as! Calendar, hour: events.startingHour, minute: events.startingMinute,  weekday: dayWeek,  weekOfYear: 23)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent,
                                                        repeats: false)
            let identifier = "\(events.id)"
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
                if(error == nil) {
                    DispatchQueue.main.async {
                        self.notButton.image = UIImage(named: "cancel")
                        self.isNotification = true
                    }
                }
            })
        }
    }
    
    
    
}
