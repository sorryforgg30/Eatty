//
//  CreatTableViewCell.swift
//  whereToEat?
//
//  Created by Gary on 2017/9/11.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class CreatTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loveBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
