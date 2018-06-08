//
//  TrainTableViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 02/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class TrainTableViewController: UITableViewController {
    
    var trains: [Event] = []
    var trainsToPoz: [Event] = []
    var trainsToSal: [Event] = []
    var trainsToCF: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        trains = loadEvents()
        
        for train in trains {
            if(train.tag == "Train") {
                switch train.day {
                case 0:
                    trainsToPoz.append(train)
                case 1:
                    trainsToCF.append(train)
                case 2:
                    trainsToSal.append(train)
                default:
                    trainsToPoz.append(train)
                }
            }
            
        }
        
        navigationController?.navigationBar.barStyle = .blackTranslucent
        tabBarController?.tabBar.barStyle = .black
        tableView.backgroundColor = UIColor(red:0.14, green:0.15, blue:0.17, alpha:1.0)
        

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
        
        switch section {
        case 0:
            return trainsToPoz.count
        case 1:
            return trainsToCF.count
        case 2:
            return trainsToSal.count
        default:
            return 0
        }
        
    }
    
     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Trains to Pozzuoli"
        case 1:
            return "Trains to Campi Flegrei"
        case 2:
            return "Trains to Salerno"
        default:
            return "No Trains"
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "train", for: indexPath) as? TrainTableViewCell  else {
            fatalError("The dequeued cell is not an instance")
        }
        cell.backgroundColor = UIColor(red:0.12, green:0.12, blue:0.14, alpha:1.0)
        cell.title.textColor = UIColor.white
        cell.subTitle.textColor = UIColor.lightGray
        
        switch indexPath.section {
        case 0:
            cell.title.text = returnTitle(events: trainsToPoz, indexPath: indexPath)
            cell.subTitle.text = returnSubTitle(events: trainsToPoz, indexPath: indexPath)
        case 1:
            cell.title.text = returnTitle(events: trainsToCF, indexPath: indexPath)
            cell.subTitle.text = returnSubTitle(events: trainsToCF, indexPath: indexPath)
        case 2:
            cell.title.text = returnTitle(events: trainsToSal, indexPath: indexPath)
            cell.subTitle.text = returnSubTitle(events: trainsToSal, indexPath: indexPath)
        default:
            cell.title.text = "Meeting time: 00:00"
            cell.subTitle.text = "Departure time: 00:00"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.white
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(red:0.99, green:0.37, blue:0.64, alpha:1.0)
    }
    
    
    func returnTitle(events: [Event], indexPath: IndexPath)->String {
        var stminute = "00"
        
        if(events[indexPath.row].startingMinute != 0 ){
            stminute = "\(events[indexPath.row].startingMinute)"
        }
        
        if(events[indexPath.row].startingMinute < 10 ){
            stminute = "0\(events[indexPath.row].startingMinute)"
        }
        
        return  "Meeting time: \(events[indexPath.row].startingHour):\(stminute) at Welcome Desk"
        
    }
    
    func returnSubTitle(events: [Event], indexPath: IndexPath)->String {
        var edminute = "00"
        if(events[indexPath.row].endingMinute != 0) {
            edminute = "\(trainsToSal[indexPath.row].endingMinute)"
        }
        if(events[indexPath.row].endingMinute < 10) {
            edminute = "0\(events[indexPath.row].endingMinute)"
        }
        return "Departure time: \(events[indexPath.row].endingHour):\(edminute)"
    }

}
