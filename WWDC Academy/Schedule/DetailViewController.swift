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
    
    override func viewDidLoad() {
        name.text = events.name
        self.title = events.name
        
        switch events.day {
        case 0:
            data.text =  "\(events.location) | 4 June \(events.startingHour):00 - \(events.ending)"
        case 1:
            data.text = "\(events.location) | 5 June \(events.startingHour):00 - \(events.ending)"
        case 2:
            data.text = "\(events.location) | 6 June \(events.startingHour):00 - \(events.ending)"
        case 3:
            data.text = "\(events.location) | 7 June \(events.startingHour):00 - \(events.ending)"
        default:
            data.text = "4 June"
        }
        
        tag.text = events.tag.uppercased()
        location.image = UIImage(named: events.location)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }



}
