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
            if(train.tag == "Train"){
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
            return "Trains to Pozzuli"
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
        switch indexPath.section {
        case 0:
            var stminute = "00"
            var edminute = "00"
            if(trainsToPoz[indexPath.row].startingMinute != 0 ){
                stminute = "\(trainsToPoz[indexPath.row].startingMinute)"
            }
            if(trainsToPoz[indexPath.row].endingMinute != 0 ){
                edminute = "\(trainsToPoz[indexPath.row].endingMinute)"
            }
            if(trainsToPoz[indexPath.row].startingMinute < 10 ){
                stminute = "0\(trainsToPoz[indexPath.row].startingMinute)"
            }
            if(trainsToPoz[indexPath.row].endingMinute < 10 ){
                edminute = "0\(trainsToPoz[indexPath.row].endingMinute)"
            }
            cell.title.text = "Meeting time: \(trainsToPoz[indexPath.row].startingHour):\(stminute)"
            cell.subTitle.text = "Departure time: \(trainsToPoz[indexPath.row].endingHour):\(edminute)"
        case 1:
            var stminute = "00"
            var edminute = "00"
            if(trainsToCF[indexPath.row].startingMinute != 0){
                stminute = "\(trainsToSal[indexPath.row].startingMinute)"
            }
            if(trainsToCF[indexPath.row].endingMinute != 0){
                edminute = "\(trainsToSal[indexPath.row].endingMinute)"
            }
            if(trainsToCF[indexPath.row].startingMinute < 10){
                stminute = "0\(trainsToSal[indexPath.row].startingMinute)"
            }
            if(trainsToCF[indexPath.row].endingMinute < 10){
                edminute = "0\(trainsToSal[indexPath.row].endingMinute)"
            }
            cell.title.text = "Meeting time: \(trainsToCF[indexPath.row].startingHour):\(stminute)"
            cell.subTitle.text = "Departure time: \(trainsToCF[indexPath.row].endingHour):\(edminute)"
        case 2:
            var stminute = "00"
            var edminute = "00"
            if(trainsToSal[indexPath.row].startingMinute != 0){
                stminute = "\(trainsToSal[indexPath.row].startingMinute)"
            }
            if(trainsToSal[indexPath.row].endingMinute != 0){
                edminute = "\(trainsToSal[indexPath.row].endingMinute)"
            }
            if(trainsToSal[indexPath.row].startingMinute < 10){
                stminute = "0\(trainsToSal[indexPath.row].startingMinute)"
            }
            if(trainsToSal[indexPath.row].endingMinute < 10){
                edminute = "0\(trainsToSal[indexPath.row].endingMinute)"
            }
            cell.title.text = "Meeting time: \(trainsToSal[indexPath.row].startingHour):\(stminute)"
            cell.subTitle.text = "Departure time: \(trainsToSal[indexPath.row].endingHour):\(edminute)"
        default:
            cell.title.text = "Meeting time: 00:00"
            cell.subTitle.text = "Departure time: 00:00"
        }
        
        return cell
    }
    

}