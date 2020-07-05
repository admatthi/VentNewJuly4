//
//  AppDelegate.swift
//  Cleanse
//
//  Created by Alek Matthiessen on 10/26/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher
import FirebaseDatabase
import FirebaseStorage
import Purchases
import FBSDKCoreKit

var entereddiscount = String()

var actualdiscount = String()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var purchases: Purchases?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        AppEvents.activateApp()

        refer = "On Open"
        
        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarBuyer : UITabBarController = mainStoryboardIpad.instantiateViewController(withIdentifier: "HomeTab") as! UITabBarController
        
        uid = UIDevice.current.identifierForVendor?.uuidString ?? "x"

        Purchases.debugLogsEnabled = true
                 Purchases.configure(withAPIKey: "tlzhsFPXMdnNLAfRPBzhSReRACXlKinw", appUserID: nil)

        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabBarBuyer
        
        self.window?.makeKeyAndVisible()
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
          
          if launchedBefore {
              
//              tabBarBuyer.selectedIndex = 0
              
          } else {
              
            tabBarBuyer.selectedIndex = 1
            
            ref?.child("Favorites").child(uid).childByAutoId().updateChildValues(["Name" : "Morning Motivation", "Description" : "Achieve Your Goals", "Image" : "https://firebasestorage.googleapis.com/v0/b/cleanse-recipes.appspot.com/o/Morning%403x.png?alt=media&token=bd8c18b6-bcae-4f6a-82a8-be6b940fbcdb", "Headline1" : "What are you grateful for this morning?", "Headline2" : "What are you working towards? What is your goal?", "Headline3" : "What are three things you need to do today to get closer your goal?", "Headline4" : "What will make today great?",  "Popularity" : 0 ])
            
            ref?.child("Favorites").child(uid).childByAutoId().updateChildValues(["Name" : "Lesson Learned", "Description" : "Never Make The Same Mistake Twice", "Image" : "https://firebasestorage.googleapis.com/v0/b/cleanse-recipes.appspot.com/o/Green%403x.png?alt=media&token=67ecfae9-a494-4fbe-bb2f-793d3ebe4ddb", "Headline1" : "What happened?", "Headline2" : "What did you expect to happen?", "Headline3" : "What will you do differently next time?", "Popularity" : 1 ])

              
              UserDefaults.standard.set(true, forKey: "launchedBefore")
              
          }
        
        queryforpaywall()
        return true
    }
    
    func queryforpaywall() {
                
        ref?.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            
     
            
            if let slimey = value?["Slimey"] as? String {

                slimeybool = true
                
            } else {
                
                slimeybool = false

            }
            
            if let discountcode = value?["DiscountCode"] as? String {
                
               actualdiscount = discountcode
                
            } else {
                
                
            }
        })
        
    }
    
    

    // MARK: UISceneSession Lifecycle




}






