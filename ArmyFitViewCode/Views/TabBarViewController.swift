//
//  TabBarViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarController()
    }
    
    private func setupTabBar() {
        //           self.tabBar.isTranslucent = false
        //           self.tabBar.itemPositioning = .centered
        //           self.tabBar.itemWidth = 40
        //           self.tabBar.itemSpacing = 35
        
        self.tabBar.tintColor = UIColor(named: "green")
//        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.backgroundColor = UIColor(named: "dark")
    }
    
    private func setupTabBarController() {
        let feedScreen = FeedViewController()
        let scheduleScreen = ScheduleViewController()
        let trainingScreen = TrainingViewController()
        let profileScreen = ProfileViewController()
        
        self.setViewControllers([
            feedScreen,
            scheduleScreen,
            trainingScreen,
            profileScreen], animated: false)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "house.fill")
        items[1].image = UIImage(systemName: "calendar")
        items[2].image = UIImage(systemName: "bicycle.circle.fill")
        items[3].image = UIImage(systemName: "person.crop.circle")
    }
}
