//
//  EggCollectionViewCell.swift
//  whereToEat?
//
//  Created by Gary on 2017/9/8.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class EggCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eggImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        eggImg.image = UIImage(named:"egg")
        //        egg.adjustsImageWhenHighlighted = false
    }
}
