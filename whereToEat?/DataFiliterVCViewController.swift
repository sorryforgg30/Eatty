//
//  dataFiliterVCViewController.swift
//  whereToEat?
//
//  Created by Gary on 2017/9/8.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class DataFiliterVCViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var prefer: Int = -1
    var allData :Top10Structure?
    var isOpen:[Int] = []
    var cellId:[Int] = []
    var cellName:[String] = []
    var cellTime:[String] = []
    var cellNumber:[String] = []
    var cellAddress:[String] = []
    var loveMenu:[Int] = []

    var rgb:[(CGFloat,CGFloat,CGFloat,CGFloat)] = [(248,251,253,0.95),(124,180,176,0.07),(186,229,216,0.07),(238,211,88, 0.07),(157, 144,175, 0.07),(242,179,169, 0.07),(108,136,177, 0.1),(43,116,127, 0.1)]
    
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var creatBtn: UIButton!
    
    @IBOutlet weak var topImg: UIImageView!
    @IBOutlet weak var preferImg: UIImageView!
    
    @IBOutlet weak var timeImg: UIImageView!
    @IBOutlet weak var phoneImg: UIImageView!
    
    @IBOutlet weak var locationImg: UIImageView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isOpen[section] == 0 {
            return 0
        }else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header : dataFilterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "datafilterTableViewCell") as! dataFilterTableViewCell
            header.name.text = cellName[section]
            header.expandBtn.tag = section
        let btnTag : Int = cellId[section] - 1
            header.loveButton.tag = btnTag
        if loveMenu.contains(header.loveButton.tag){
            header.loveButton.setImage(UIImage(named:"love1"), for: .normal)
        }else{
            header.loveButton.setImage(UIImage(named:"love0"), for: .normal)
        }
        return header
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.section,indexPath.row)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:dataInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "dataInfoTableViewCell", for: indexPath) as! dataInfoTableViewCell
        cell.backgroundColor = UIColor(red:rgb[prefer-1].0/255.0, green:rgb[prefer-1].1/255.0, blue:rgb[prefer-1].2/255.0, alpha:rgb[prefer-1].3)
        cell.address.text = cellAddress[indexPath.section]
        cell.phoneNumber.text = cellNumber[indexPath.section]
        cell.time.text = cellTime[indexPath.section]
        cell.timeImg.image = UIImage(named : "time\(prefer)")
        cell.phoneImg.image = UIImage(named : "phone\(prefer)")
        cell.locationImg.image = UIImage(named : "location\(prefer)")
    
        return cell
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView( CGRect(x:0, y:0, width: tableView.frame.size.width, height:10))
//        footerView.backgroundColor = UIColor.white
//
//        return footerView
//    } 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 3
    }
    @IBAction func loveIt(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named : "love0"){
            sender.setImage(UIImage(named:"love1"), for: .normal)
            loveMenu.append(sender.tag)
//            print(sender.tag)
        }else{
            sender.setImage(UIImage(named:"love0"), for: .normal)
            loveMenu.remove(at:loveMenu.index(of : sender.tag)! )
        }
        UserDefaults.standard.set(loveMenu,forKey : "loveMenu")
        tableView.reloadData()
        print (loveMenu)
    }
    @IBAction func expand(_ sender: UIButton) {
        print(sender.tag)
        if isOpen[sender.tag] == 0  {
            for i in 0..<isOpen.count{
                isOpen[i] = 0
            }
            isOpen[sender.tag] = 1
            
        }else{
             isOpen[sender.tag] = 0
        }
        self.tableView.reloadData()
    }
        func showPageSelction(){
            let count = (allData?.Top10Restaurant.restaurants.count)!
            for _ in 1...count{
                isOpen.append(0)
            }
            isOpen[0] = 1
            for i in 0...count-1{
                if allData?.Top10Restaurant.restaurants[i].restaurant_type == "\(prefer)"{
                    cellName.append((allData?.Top10Restaurant.restaurants[i].restaurant_name)!)
                    cellTime.append((allData?.Top10Restaurant.restaurants[i].restaurant_available_time)!)
                    cellAddress.append((allData?.Top10Restaurant.restaurants[i].restaurant_location
                        )!)
                    cellId.append(Int((allData?.Top10Restaurant.restaurants[i].restaurant_identification)!)!)
                    cellNumber.append((allData?.Top10Restaurant.restaurants[i].restaurant_phone)!)
                }
            }
            if prefer == 7  {
                for i in loveMenu{
                    cellName.append((allData?.Top10Restaurant.restaurants[i].restaurant_name)!)
                    cellTime.append((allData?.Top10Restaurant.restaurants[i].restaurant_available_time)!)
                    cellAddress.append((allData?.Top10Restaurant.restaurants[i].restaurant_location
                        )!)
                    cellId.append(Int((allData?.Top10Restaurant.restaurants[i].restaurant_identification)!)!)
                    cellNumber.append((allData?.Top10Restaurant.restaurants[i].restaurant_phone)!)
                }
                 self.navigationController?.navigationBar.tintColor = UIColor.white
                topImg.image = UIImage(named :"prefer\(prefer)")
                
                
            }
                if prefer == 8 {
                    selectBtn.isHidden = false
                    for i in [0,5,14,8,4]{
                        
                        cellName.append((allData?.Top10Restaurant.restaurants[i].restaurant_name)!)
                        cellTime.append((allData?.Top10Restaurant.restaurants[i].restaurant_available_time)!)
                        cellAddress.append((allData?.Top10Restaurant.restaurants[i].restaurant_location
                            )!)
                        cellId.append(Int((allData?.Top10Restaurant.restaurants[i].restaurant_identification)!)!)
                        cellNumber.append((allData?.Top10Restaurant.restaurants[i].restaurant_phone)!)
                    }
                    
                }
            
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.blue
        selectBtn.isHidden = true
        creatBtn.isHidden = true
        for item in UserDefaults.standard.array(forKey: "loveMenu")!{
            print(item)
            loveMenu.append(item as! Int)
        }
        print (loveMenu)
        parseLocalFile()
        
        showPageSelction()
        if prefer != 7 {
        preferImg.image = UIImage(named : "prefer\(prefer)")
        }
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func parseLocalFile() {
        let jsonFilePath:String = Bundle.main.path(forResource: "top10Restauran", ofType: "txt")!
//        print(jsonFilePath)
        let url:URL = URL(fileURLWithPath: jsonFilePath)
        do {
            let jsonData:Data? = try Data(contentsOf: url)
            allData =  try JSONDecoder().decode(Top10Structure.self, from: jsonData!)
        } catch let error as NSError {
            print("\(error)")
        }
    }
    
    @IBAction func showSelectPage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toRestVC", sender: nil)
    }
    
    @IBAction func creatAction(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRestVC" {
            let random = Int(arc4random_uniform(4))
            let nextVC:RandomVC =  segue.destination as! RandomVC
            
            nextVC.namer = (allData?.Top10Restaurant.restaurants[random].restaurant_name)!
            nextVC.timer = (allData?.Top10Restaurant.restaurants[random].restaurant_available_time)!
            nextVC.phoner = (allData?.Top10Restaurant.restaurants[random].restaurant_phone)!
            nextVC.addressr = (allData?.Top10Restaurant.restaurants[random].restaurant_location)!
            nextVC.tagr = random
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  

}
