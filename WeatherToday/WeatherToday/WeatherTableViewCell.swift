//
//  WeatherTableViewCell.swift
//  WeatherToday
//
//  Created by 임태완 on 2019. 8. 20..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet var cityLabel : UILabel?
    @IBOutlet var tempLabel : UILabel?
    @IBOutlet var rainyLabel : UILabel?
    @IBOutlet var weatherImage : UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
