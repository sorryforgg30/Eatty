//
//  CreatSelectVC.swift
//  whereToEat?
//
//  Created by Gary on 2017/9/11.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class CreatSelectVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    @IBOutlet weak var tableView: UITableView!
    var preferSelect = 0
    var tableViewArray:[String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        endKey.isHidden = false
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.backgroundColor = UIColor(red:0.95, green:0.98, blue:0.98, alpha:1.0)
        cell.textLabel?.text = tableViewArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 7
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableViewArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            UserDefaults.standard.set(tableViewArray,forKey:"wantTo")
            tableView.reloadData()
        }
    }
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
//            tableView.isEditing = true
        // Do any additional setup after loading the view.
        for item in UserDefaults.standard.array(forKey: "wantTo")!{
            tableViewArray.append(item as! String)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var endKey: UIButton!
    @IBAction func inputToTableView(_ sender: Any) {
        if inputTextField.text != ""{
            tableViewArray.append(inputTextField.text!)
            tableView.reloadData()
            inputTextField.text = ""
            UserDefaults.standard.set(tableViewArray,forKey:"wantTo")
        }else{
            let alert : UIAlertController = UIAlertController(title :"錯誤",message :"輸入欄位不可為空白",preferredStyle : .alert)
            let cancel = UIAlertAction(
                title: "確定",
                style: .default,
                handler: {
                    (action: UIAlertAction!) -> Void in
                    print("按下確認後，閉包裡的動作")
            })
            alert.addAction(cancel)
        }
    }
    
    @IBAction func searchForLove(_ sender: Any) {
        
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func endKeyBoard(_ sender: Any) {
        self.view.endEditing(true)
        endKey.isHidden = true
        
    }
    
    @IBAction func toSelectPage(_ sender: Any) {
        if tableViewArray.count != 0{
            self.performSegue(withIdentifier: "toRandomVC", sender: nil)
            UserDefaults.standard.set([],forKey:"wantTo")
        }else{
            let alert : UIAlertController = UIAlertController(title :"錯誤",message :"不可沒有任何店家",preferredStyle : .alert)
            let cancel = UIAlertAction(
                title: "確定",
                style: .default,
                handler: {
                    (action: UIAlertAction!) -> Void in
                    print("按下確認後，閉包裡的動作")
            })
            alert.addAction(cancel)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRandomVC" {
            let random = Int(arc4random_uniform(UInt32(tableViewArray.count-1)))
            let nextVC:RandomVC =  segue.destination as! RandomVC

            nextVC.namer = tableViewArray[random]

        }
        if segue.identifier == "toPreferVC" {
            let secondVC:DifferentCategoryVC =  segue.destination as! DifferentCategoryVC

            secondVC.arrayList = tableViewArray
        }
    }
}
