//
//  AppDelegate.swift
//  WPAPI
//
//  Created by 133342301@163.com on 12/31/2017.
//  Copyright (c) 2017 133342301@163.com. All rights reserved.
//

import UIKit
import WPAPI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        _ = WP(baseURL: "https://wp.sk8.tech")
//        WP.sharedInstance.updateAuthToken(authToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvd3Auc2s4LnRlY2giLCJpYXQiOjE1MTQ3ODg0NzYsIm5iZiI6MTUxNDc4ODQ3NiwiZXhwIjoxNTE1MzkzMjc2LCJkYXRhIjp7InVzZXIiOnsiaWQiOiIxIn19fQ.imhOZofAkhuBhcPfc8k44G3be3R2f1CB08dfzukrb7Y") { (response: Result<User>) in
//
//            switch response {
//            case .success(let me):
//                print("App: currentUser is \(me.email!)")
//            case .failure(let error):
//                print("App: currentUser error \(error)")
//            }
//        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

