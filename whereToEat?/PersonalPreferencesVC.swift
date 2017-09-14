//
//  PersonalPreferencesVC.swift
//  lunch?
//
//  Created by CurtisCiou on 2017/9/1.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class PersonalPreferencesVC: UIViewController {
    @IBOutlet weak var distanceAsTimeValue: UISlider!
    @IBOutlet weak var priceValue: UISlider!
    
    var preferencesHolder:[Int] = [0,0]
    
    @IBAction func distanceAsTimeSlider(_ sender: UISlider) {
        distanceAsTimeValue.value = roundf(distanceAsTimeValue.value)
    }
    
    @IBAction func priceSlider(_ sender: UISlider) {
        priceValue.value = roundf(priceValue.value)
    }
    
    @IBAction func showPreferences(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        get the two preference from button and send
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
