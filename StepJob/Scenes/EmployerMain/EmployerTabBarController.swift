//
//  EmployerTabBarController.swift
//  StepJob
//
//  Created by Sirius on 31.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class EmployerTabBarController: UITabBarController {
    
    var messagesVC = MessagesViewController()
    var createAdVC = AdDescriptionViewController()
    var profileVC = MyProfileViewController(nibName: "MyProfileViewController", bundle: nil)
    var moreVC = UIViewController()
    
    override func viewDidLoad() {
        tabBar.tintColor = UIColorFromRGB(0xff6265)
        
        let storyboard = UIStoryboard(name: "Employer", bundle: nil)
        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "EmployerDashboardViewController")
        let dashboardImage = resizeImage(image: UIImage(named: "home")!, targetSize: CGSize(width: 28, height: 28))
        let dashboardTabBarItem = UITabBarItem(title: "Dashboard",
                                               image: dashboardImage.withRenderingMode(.alwaysTemplate),
                                               selectedImage: dashboardImage.withRenderingMode(.alwaysTemplate))
        
        dashboardVC.tabBarItem = dashboardTabBarItem
        
        let messagesImage = resizeImage(image: UIImage(named: "chat")!, targetSize: CGSize(width: 28, height: 28))
        let messagesTabBarItem = UITabBarItem(title: "Messages",
                                              image: messagesImage.withRenderingMode(.alwaysTemplate),
                                              selectedImage: messagesImage.withRenderingMode(.alwaysTemplate))
        messagesTabBarItem.badgeColor = UIColor.red
        messagesVC.tabBarItem = messagesTabBarItem
        
        let createAdImage = resizeImage(image: UIImage(named: "company")!, targetSize: CGSize(width: 28, height: 28))
        let createAdTabBarItem = UITabBarItem(title: "İlan", image: createAdImage.withRenderingMode(.alwaysTemplate),
                                              selectedImage: createAdImage.withRenderingMode(.alwaysTemplate))
        createAdVC.tabBarItem = createAdTabBarItem
        
        let profileImage = resizeImage(image: UIImage(named: "profile")!, targetSize: CGSize(width: 28, height: 28))
        let profileTabBarItem = UITabBarItem(title: "Profile",
                                             image: profileImage.withRenderingMode(.alwaysTemplate),
                                             selectedImage: profileImage.withRenderingMode(.alwaysTemplate))
        profileVC.tabBarItem = profileTabBarItem
        
        let moreImage = resizeImage(image: UIImage(named: "more")!, targetSize: CGSize(width: 28, height: 28))
        let moreTabBarItem = UITabBarItem(title: "More",
                                          image: moreImage.withRenderingMode(.alwaysTemplate),
                                          selectedImage: moreImage.withRenderingMode(.alwaysTemplate))
        moreVC.tabBarItem = moreTabBarItem
        
        let tabBarList: [UIViewController] = [dashboardVC, messagesVC, createAdVC, profileVC, moreVC]
        viewControllers = tabBarList
    }
    
}

