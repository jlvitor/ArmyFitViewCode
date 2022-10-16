//
//  TabBarViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    //MARK: - Private properties
    private var customTabBar: TabNavigationScreen!
    private var tabBarHeight: CGFloat = 80.0
    
    //MARK: - Init`s
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
    }
    
    //MARK: - Private methods
    private func loadTabBar() {
        let tabItems: [TabItem] = [.home, .schedule, .training, .profile]
        
        self.setupCustomTabMenu(tabItems) { controllers in
            self.viewControllers = controllers
        }
        
        self.selectedIndex = 0
    }
    
    private func setupCustomTabMenu(_ menuItems: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        
        tabBar.isHidden = true
        
        self.customTabBar = TabNavigationScreen(menuItems: menuItems, frame: frame)
        self.customTabBar.clipsToBounds = true
        self.customTabBar.itemTapped = self.changeTab(tab:)
        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(customTabBar)
        
        NSLayoutConstraint.activate([
            self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            self.customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
            self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
        
        for i in 0..<menuItems.count {
            controllers.append(menuItems[i].viewController)
        }
        
        self.view.layoutIfNeeded()
        completion(controllers)
    }
    
    private func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
}
