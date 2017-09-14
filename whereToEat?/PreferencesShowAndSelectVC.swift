//
//  PreferencesShowAndSelectVC.swift
//  lunch?
//
//  Created by CurtisCiou on 2017/9/1.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class PreferencesShowAndSelectVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var highRankResturant:Top10Structure?
    
    @IBOutlet weak var tableView: UITableView!
    
//    test local json File
    fileprivate func parseLocalFile() {
        let jsonFilePath:String = Bundle.main.path(forResource: "top10Restauran", ofType: "txt")!
        print(jsonFilePath)
        let url:URL = URL(fileURLWithPath: jsonFilePath)
        do {
            let jsonData:Data? = try Data(contentsOf: url)
            highRankResturant =  try JSONDecoder().decode(Top10Structure.self, from: jsonData!)
            self.tableView.reloadData()
            print(highRankResturant!)
        } catch let error as NSError {
            print("\(error)")
        }
    }
    
    func downloadJSONFile(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url:URL = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ed83db24-f206-4ff0-9135-a0a8d65ace31")!
        DispatchQueue.global().async {
            do {
                let data:Data = try Data(contentsOf: url)
                self.highRankResturant =  try JSONDecoder().decode(Top10Structure?.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }catch {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        parseLocalFile()
//        downloadJSONFile()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if highRankResturant == nil{
            return 0
        }
        return (highRankResturant?.Top10Restaurant.restaurants.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreferencesSourceCell", for: indexPath)
        cell.textLabel?.text = highRankResturant?.Top10Restaurant.restaurants[indexPath.row].restaurant_name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        prepare next segue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

