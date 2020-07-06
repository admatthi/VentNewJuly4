//
//  AnalyticsViewController.swift
//  Cleanse
//
//  Created by Alek Matthiessen on 7/6/20.
//  Copyright © 2020 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase

class AnalyticsViewController: UIViewController {
    
    @IBOutlet weak var sessionlabel: UILabel!
    
    @IBOutlet weak var writinglabel: UILabel!
    
    @IBOutlet weak var wordslabel: UILabel!
    @IBOutlet weak var backimage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backimage.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backimage.addSubview(blurEffectView)
        
        queryforinfo()
        // Do any additional setup after loading the view.
    }
    
    func queryforinfo() {
        
        ref?.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            
            if let time = value?["Time"] as? Int {
                
                mytime = time
                
                self.writinglabel.text = "\(String(mytime/60))m"
                
            }
            
            
            if let words = value?["Words"] as? Int {
                
                mywords = words
                self.wordslabel.text = String(mywords)
                
            }
            
            if let purchased = value?["Purchased"] as? String {
                
                if purchased == "True" {
                    
                    didpurchase = true
                    
                } else {
                    
                    didpurchase = false
                    self.performSegue(withIdentifier: "DailyToSale", sender: self)
                    
                }
                
            } else {
                
                didpurchase = false
                self.performSegue(withIdentifier: "DailyToSale", sender: self)
            }
            
        })
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
