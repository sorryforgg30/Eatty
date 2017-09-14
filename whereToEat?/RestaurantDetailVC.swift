//
//  ResturantDetailVC.swift
//  lunch?
//
//  Created by CurtisCiou on 2017/9/1.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class RestaurantDetailVC: UIViewController {
    var tag = -1
    var loveMenu:[Int] = []
    var name = ""
    var address = ""
    var time = ""
    var phone = ""
    
    @IBOutlet weak var loveBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
  
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        let dataVC :DataFiliterVCViewController = DataFiliterVCViewController()
//        
//        dataVC.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor.white
        for item in UserDefaults.standard.array(forKey: "loveMenu")!{
            print(item)
            loveMenu.append(item as! Int)
        }
        
        nameLabel.text = name
        numberLabel.text = phone
        timeLabel.text = time
        addressLabel.text = address
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func loveIt(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named : "love0"){
            sender.setImage(UIImage(named:"love1"), for: .normal)
            loveMenu.append(tag)
            //            print(sender.tag)
        }else{
            sender.setImage(UIImage(named:"love0"), for: .normal)
            loveMenu.remove(at:loveMenu.index(of : tag)! )
        }
        UserDefaults.standard.set(loveMenu,forKey : "loveMenu")
        print (loveMenu)
    }
    
}
