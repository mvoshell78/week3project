//
//  CustomCell.swift
//  Week3Project
//
//  Created by Michael Voshell on 6/13/15.
//  Copyright (c) 2015 Michael Voshell. All rights reserved.
//

import UIKit
// creates custom cell for table view
class CustomCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
