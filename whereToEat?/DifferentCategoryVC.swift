//
//  DifferentCategoryVC.swift
//  whereToEat?
//
//  Created by CurtisCiou on 2017/9/8.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class DifferentCategoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var allData :Top10Structure?
    @IBOutlet weak var tableView: UITableView!
    var loveMenu:[Int] = []
    var loveArray:[String] = []
    var arrayList:[String] = []
    var newArray:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.navigationBar.tintColor = UIColor.white
        creatBtn.backgroundColor = UIColor(red:0.43, green:0.69, blue:0.78, alpha:1.0)
        creatBtn.layer.borderWidth = 1
        creatBtn.layer.borderColor = UIColor(red:0.22, green:0.58, blue:0.70, alpha:1.0).cgColor
        creatBtn.layer.cornerRadius = 20
        
        parseLocalFile()
        for item in UserDefaults.standard.array(forKey: "loveMenu")!{
            print(item)
            loveMenu.append(item as! Int)
        }
        for i in loveMenu{
            loveArray.append((allData?.Top10Restaurant.restaurants[i].restaurant_name)!)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loveArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "creatCell", for: indexPath) as! CreatTableViewCell
        cell.nameLabel.text = loveArray[indexPath.row]
        cell.loveBtn.tag = loveMenu[indexPath.row]
        if loveMenu.contains(cell.loveBtn.tag){
            cell.loveBtn.setImage(UIImage(named:"love1"), for: .normal)
        }else{
            cell.loveBtn.setImage(UIImage(named:"love0"), for: .normal)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            loveArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            tableView.reloadData()
        }
    }
    
    @IBAction func loveAction(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named : "love0"){
            sender.setImage(UIImage(named:"love1"), for: .normal)
            loveMenu.append(sender.tag)
            //            print(sender.tag)
        }else{
            sender.setImage(UIImage(named:"love0"), for: .normal)
            loveMenu.remove(at:loveMenu.index(of : sender.tag)! )
        }
        UserDefaults.standard.set(loveMenu,forKey : "loveMenu")
     
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
    @IBOutlet weak var creatBtn: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func creatAction(_ sender: Any) {
        newArray = UserDefaults.standard.array(forKey: "wantTo") as! [String]
        for item in loveArray{
            newArray.append(item)
            UserDefaults.standard.set(newArray,forKey:"wanTo")
//            navigationController?.popViewController(animated: true)
           // self.dismiss(animated: true, completion: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "deadLockSegue" {
            
            let nextVC:CreatSelectVC =  segue.destination as! CreatSelectVC
            nextVC.tableViewArray = arrayList + newArray
            
            
        }
    }
}
