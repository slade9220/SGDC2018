//
//  Rules.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 01/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import Foundation

struct Rule {
    var id: Int
    var name: String
    var text: String
    
    init(name:String, text: String) {
        self.id = 0
        self.name = name
        self.text = text
    }
}


