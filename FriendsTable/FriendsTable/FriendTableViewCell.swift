//
//  FriendTableViewCell.swift
//  FriendsTable
//
//  Created by 임태완 on 2019. 8. 14..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var mobileLabel : UILabel!
    @IBOutlet var ageLabel : UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
