//
//  MainViewController.swift
//  StepJob
//
//  Created by Sirius on 21.10.2019.
//  Copyright © 2019 Stepjob. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    var dashboardVC = DashboardViewController()
    var messagesVC = MessagesViewController()
    var jobsVC = MyJobsViewController(nibName: "MyJobsViewController", bundle: nil)
    var profileVC = MyProfileViewController(nibName: "MyProfileViewController", bundle: nil)
    var moreVC = MoreViewController()
    
    override func viewDidLoad() {
        tabBar.tintColor = UIColorFromRGB(0xff6265)
        
        let dashboardImage = resizeImage(image: UIImage(named: "home")!, targetSize: CGSize(width: 28, height: 28))
        let dashboardTabBarItem = UITabBarItem(title: "Dashboard",
                                              image: dashboardImage.withRenderingMode(.alwaysTemplate),
                                              selectedImage: dashboardImage.withRenderingMode(.alwaysTemplate))
        
        dashboardVC.tabBarItem = dashboardTabBarItem
        
        let jobsImage = resizeImage(image: UIImage(named: "task")!, targetSize: CGSize(width: 28, height: 28))
        let jobsTabBarItem = UITabBarItem(title: "İşlerim",
                                          image: jobsImage,
                                          selectedImage: jobsImage)
        jobsTabBarItem.badgeColor = UIColor.red
        jobsVC.tabBarItem = jobsTabBarItem
        
        let messagesImage = resizeImage(image: UIImage(named: "chat")!, targetSize: CGSize(width: 28, height: 28))
        let messagesTabBarItem = UITabBarItem(title: "Messages",
                                              image: messagesImage.withRenderingMode(.alwaysTemplate),
                                              selectedImage: messagesImage.withRenderingMode(.alwaysTemplate))
        messagesTabBarItem.badgeColor = UIColor.red
        messagesVC.tabBarItem = messagesTabBarItem
        
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
        
        let tabBarList: [UIViewController] = [dashboardVC, jobsVC, messagesVC, profileVC, moreVC]
        viewControllers = tabBarList
    }
    
}
