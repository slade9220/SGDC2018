//
//  DetailViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var events = Event()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var tag: UILabel!
    @IBOutlet weak var location: UIImageView!
    @IBOutlet weak var descText: UITextView!
    
    override func viewDidLoad() {
        name.text = events.name
//        self.title = events.name
        var startingMinute = "00"
        var endingMinute = "00"
        
        if(events.tag != "Academy"){
            descText.isHidden = true
        }
        
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

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }



}
