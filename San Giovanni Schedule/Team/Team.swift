//
//  Team.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 02/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import Foundation

struct Team {
    var name: String
    var telegram: String
    var email: String
    
    init(name: String, telegram: String, email:String) {
        self.name = name
        self.telegram = telegram
        self.email = email
    }
    
    init(name:String, telegram:String) {
        self.name = name
        self.telegram = "tg://resolve?domain=\(telegram)"
        self.email = ""
    }
}
