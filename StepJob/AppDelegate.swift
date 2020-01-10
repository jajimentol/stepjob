//
//  AppDelegate.swift
//  StepJob
//
//  Created by Jaji on 17.05.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        application.statusBarStyle = .default
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        
        onboarding()
        
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
    
    func onboarding() {
        
        viewController = UINavigationController()
        
        
        viewController?.navigationBar.titleTextAttributes =  [
            NSAttributedString.Key.font: lightFont(size: 16.0),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        viewController?.navigationBar.barTintColor = UIColorFromRGB(0x2c2d3e)
        viewController?.navigationBar.backgroundColor = UIColorFromRGB(0x2c2d3e)
        
//        let backImage = UIImage.init(named: "back_icon")
//        viewController?.navigationBar.backIndicatorImage = backImage
//        viewController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        viewController?.navigationItem.leftItemsSupplementBackButton = true
        viewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//        viewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        window?.rootViewController = viewController
        
        let vc = OnboardingViewController()
        viewController?.pushViewController(vc, animated: true)
        
    }


}

