//
//  WelcomVC.swift
//  lunch?
//
//  Created by CurtisCiou on 2017/9/1.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var preferSelect = 0
    var time = Timer()
    override func viewWillDisappear(_ animated: Bool) {
        time.invalidate()
    }
    
    
    @IBAction func showTop5(_ sender: Any) {
        preferSelect = 8
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    
    @IBAction func showUesrFavorite(_ sender: Any) {
        preferSelect = 7
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    
    @IBAction func showRandomPage(_ sender: Any) {
        
    }
    @IBAction func showNoodlesCollection(_ sender: Any) {
        preferSelect = 2
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    
    @IBAction func showRiceCollections(_ sender: Any) {
       preferSelect = 1
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
   
    
    @IBAction func showFastFoodCollection(_ sender: Any) {
        preferSelect = 4
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    
    
    @IBAction func showBrunchCollection(_ sender: Any) {
        preferSelect = 3
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    
    
    
    @IBAction func showDessertCollections(_ sender: Any) {
        preferSelect = 6
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    @IBAction func showForeignCollection(_ sender: Any) {
        preferSelect = 5
        performSegue(withIdentifier: "toPreferVC", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
//        time = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @objc func timeAction(){
       
//        UIView.animate(withDuration: 3, delay: 2, options: UIViewAnimationOptions.curveEaseIn, animations: {()->Void in
//            self.top5.frame.offsetBy(dx: 0, dy: 100)
//        })
        UIView.animate(withDuration: 2, animations: {
            
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPreferVC" {
            let secondVC:DataFiliterVCViewController =  segue.destination as! DataFiliterVCViewController
            
                secondVC.prefer = preferSelect
            }
        }
}
