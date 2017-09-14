//
//  RandomVC.swift
//  lunch?
//
//  Created by CurtisCiou on 2017/9/1.
//  Copyright © 2017年 CurtisCiou. All rights reserved.
//

import UIKit

class RandomVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var longPressGesture = UILongPressGestureRecognizer()
    var tagr = 0
    var namer = ""
    var addressr = ""
    var timer = ""
    var phoner = ""
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eggCollectionViewCell", for: indexPath) as! EggCollectionViewCell
        cell.eggImg.image = UIImage(named: "egg\(arc4random_uniform(4))")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("eee")
        // Do any additional setup after loading the view, typically from a nib.
        longPressGesture = UILongPressGestureRecognizer(target:self , action: #selector(handLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 1
        self.collectionView.addGestureRecognizer(longPressGesture)
       
    }
    
    @objc func handLongPress(gesture:UILongPressGestureRecognizer){
        switch gesture.state{
        case UIGestureRecognizerState.began:
            guard let selectedIndexPath  = self.collectionView.indexPathForItem(at: gesture.location(in:self.collectionView)) else{
               
                break;
            }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath);
        case UIGestureRecognizerState.changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view));
            
        case UIGestureRecognizerState.ended:
            //換頁面
            self.performSegue(withIdentifier: "toResturantDetailVC", sender: nil)
            
                    collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement();
            
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResturantDetailVC" {
            
            let nextVC:RestaurantDetailVC =  segue.destination as! RestaurantDetailVC
            
            nextVC.name = namer
            nextVC.time = timer
            nextVC.phone = phoner
            nextVC.address = addressr
            nextVC.tag = tagr
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


