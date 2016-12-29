//
//  AppDelegate.swift
//  CoordinatorsDemo
//
//  Created by Мотылёв Михаил on 27/12/2016.
//  Copyright © 2016 None. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        startCoordinator()
        
        test1()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    private func startCoordinator() {
        guard let window = window, let rootVC = window.rootViewController else { return }
        
        DispatchQueue.main.async { [weak self] in
            
            let router = TestRouter.controller(fromStoryboardNamed: "Main")
            
            rootVC.present(router, animated: false) { [weak self] in
                
                self?.rootCoordinator = Coordinator1(router: router)
                self?.rootCoordinator?.start()
                
            }
        }
    }
    
    func test1() {
        
        /*
        
        let s1 = "ffff\(Date())fdddd"
        let s2 = "fafd\(Date())fsfsd"
        
        var date = Date()
        
        let s = S(s1: s1, s2: s2)
        
        for i in 0 ..< 100000000 {
            convert(s: s)
        }
        
        NSLog("Time \(-date.timeIntervalSinceNow)")
        
        date = Date()
        
        let c = C(s1: s1, s2: s2)
        
        for i in 0 ..< 100000000 {
            convert(c: c)
        }
        
        NSLog("Time \(-date.timeIntervalSinceNow)") */

    }
}

final class C {
    
    let s1: String
    let s2: String
    
    init(s1: String, s2: String) {
        
        self.s1 = s1
        self.s2 = s2
    }
}

struct S {
    
    let s1: String
    let s2: String
}

func convert(c: C) -> String {
    return c.s1
}

func convert(s: S) -> String {
    return s.s1
}


