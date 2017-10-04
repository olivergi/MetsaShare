//
//  Location.swift
//  MetsäShare
//
//  Created by iosdev on 4.10.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var locationName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
