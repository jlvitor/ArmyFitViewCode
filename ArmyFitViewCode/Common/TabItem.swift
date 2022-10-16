//
//  TabItem.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 15/10/22.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case schedule = "schedule"
    case training = "training"
    case profile = "profile"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return UINavigationController(rootViewController: FeedViewController())
        case .schedule:
            return UINavigationController(rootViewController: ScheduleViewController())
        case .training:
            return UINavigationController(rootViewController: TrainingViewController())
        case .profile:
            return UINavigationController(rootViewController: ProfileViewController())
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")!
        case .schedule:
            return UIImage(systemName: "calendar")!
        case .training:
            return UIImage(systemName: "figure.strengthtraining.traditional")!
        case .profile:
            return UIImage(systemName: "person.fill")!
        }
    }
}
