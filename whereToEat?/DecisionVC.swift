//
//  DecisionVC.swift
//  whereToEat?
//
//  Created by CurtisCiou on 2017/9/8.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class DecisionVC: UIViewController {
    
    @IBAction func createOptionButton(_ sender: Any) {
    }
    
    @IBAction func conditionFilter(_ sender: Any) {
    }
    @IBOutlet weak var filterBtn: UIButton!
    
    @IBOutlet weak var creatBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        creatBtn.layer.borderColor = UIColor.gray.cgColor
        creatBtn.layer.cornerRadius = 20
        creatBtn.layer.borderWidth = 1
        filterBtn.layer.borderColor = UIColor.gray.cgColor
        filterBtn.layer.cornerRadius = 20
        filterBtn.layer.borderWidth = 1
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        creatBtn.layer.borderColor = UIColor.gray.cgColor
        creatBtn.backgroundColor = UIColor.white
        creatBtn.setTitleColor(UIColor(red:0.58, green:0.66, blue:0.89, alpha:1.0) , for:.normal )
        filterBtn.layer.borderColor = UIColor.gray.cgColor
        filterBtn.backgroundColor = UIColor.white
        filterBtn.setTitleColor(UIColor(red:0.58, green:0.66, blue:0.89, alpha:1.0) , for:.normal )
    }
    @IBAction func creatBtnAction(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.58, green:0.66, blue:0.89, alpha:1.0)
        sender.setTitleColor(UIColor.white , for:.normal )
        sender.layer.borderColor = UIColor(red:0.45, green:0.54, blue:0.83, alpha:1.0).cgColor
    }
    @IBAction func filterBtnAction(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.58, green:0.66, blue:0.89, alpha:1.0)
        sender.setTitleColor(UIColor.white , for:.normal )
        sender.layer.borderColor = UIColor(red:0.45, green:0.54, blue:0.83, alpha:1.0).cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
