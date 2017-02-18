//
//  CustomTableViewCell.swift
//  Project ios
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var TestImage: UIImageView!
    @IBOutlet weak var Subtitle: UILabel!
    @IBOutlet weak var Name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
