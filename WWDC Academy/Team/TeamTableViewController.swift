//
//  TeamTableViewController.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 02/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {
    
    var teams: [Team] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        teams = [Team(name:"Gennaro Amura",telegram:"slade9220"),
                 Team(name:"Antonio Giaquinto",telegram:"Gia5A"),
                 Team(name:"Pasquale Spisto",telegram:"Pasp94"),
                    Team(name:"Eduardo Yutaka",telegram:"eduardoyutaka"),
                    Team(name:"Gaetano Matonti",telegram:"gaetanomatonti"),
                    Team(name:"Simona Scala",telegram:"claminos"),
                    Team(name:"Micol Salomone",telegram:"mico_L"),
                    Team(name:"Federico Fusco",telegram:"jamesbiond"),
                    Team(name:"Ibrahim Al Hazwani",telegram:"Ibraalhazwani"),
                    Team(name:"Anna Cassino",telegram:"AnnaCassino"),
                    Team(name:"Francesco Fuscaldo",telegram:"FranFus"),
                    Team(name:"Alessio Perrotti",telegram:"PerrottiAlessio"),
                    Team(name:"Luciano Gucciardo",telegram:"lucianolang")]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "team", for: indexPath) as! TeamTableViewCell

        cell.title.text = teams[indexPath.row].name
        

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let telegramURLWeb = URL(string: teams[indexPath.row].telegram)!
        
        UIApplication.shared.open(telegramURLWeb, options: [:])
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Tap a name to chat"
    }

    

}
