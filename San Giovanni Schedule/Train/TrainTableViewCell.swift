//
//  TrainTableViewCell.swift
//  WWDC Academy
//
//  Created by Gennaro Amura on 02/06/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class TrainTableViewCell: UITableViewCell {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
