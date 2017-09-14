//
//  dataInfoTableViewCell.swift
//  whereToEat?
//
//  Created by Gary on 2017/9/8.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class dataInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var locationImg: UIImageView!
    @IBOutlet weak var phoneImg: UIImageView!
    @IBOutlet weak var timeImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        phoneNumber.isUserInteractionEnabled = true
        address.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapCall))
        phoneNumber.addGestureRecognizer(tap)
    }

    func call(phoneNum: String) {
        if let url = URL(string: "tel://\(phoneNum)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func tapCall(sender:UITapGestureRecognizer) {
        print("tap working")
        call(phoneNum: phoneNumber.text!)//telephoneTextLabel.text
    }
   
}
