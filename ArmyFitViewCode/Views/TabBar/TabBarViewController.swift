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
        self.tabBar.tintColor = UIColor(named: "green")
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupTabBarController() {
        let feedScreen = UINavigationController(rootViewController: FeedViewController())
        let scheduleScreen = UINavigationController(rootViewController: ScheduleViewController())
        let trainingScreen = UINavigationController(rootViewController: TrainingViewController())
        let profileScreen = UINavigationController(rootViewController: ProfileViewController())
        
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
