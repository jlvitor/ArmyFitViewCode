//
//  TabNavigationScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 15/10/22.
//

import UIKit

final class TabNavigationScreen: UIView {
    
    //MARK: - Private properties
    private var activeItem: Int = 0
    
    //MARK: - Public properties
    var itemTapped: ((_ tab: Int) -> Void)?
    
    //MARK: - Init`s
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        
        self.layer.backgroundColor = UIColor(named: "dark")?.cgColor
        
        for i in 0..<menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.clipsToBounds = true
            itemView.tag = i
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(itemView)
            
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
            ])
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0)
    }
    
    //MARK: - Private methods
    private func createTabItem(item: TabItem) -> UIView {
        let tabBarItem = UIView(frame: .zero)
        let itemIconView = UIImageView(frame: .zero)
        
        itemIconView.image = item.icon.withRenderingMode(.automatic)
        itemIconView.tintColor = .white
        itemIconView.clipsToBounds = true
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        
        tabBarItem.layer.backgroundColor = UIColor(named: "dark")?.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.clipsToBounds = true
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 20),
            itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35),
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.heightAnchor.constraint(equalToConstant: 25),
            itemIconView.widthAnchor.constraint(equalToConstant: 25),
        ])
        
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(self.handleTap(_:))))
        
        return tabBarItem
    }
    
    @objc private func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    private func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    
    private func activateTab(tab: Int) {
        let tabToActivate = self.subviews[tab]
        let borderWidth = tabToActivate.frame.size.width - 20
        let borderLayer = CALayer()
        
        borderLayer.backgroundColor = UIColor(named: "green")?.cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: borderWidth, height: 2)
        
        DispatchQueue.main.async {
            UIView.animate(
                withDuration: 0.8,
                delay: 0.0,
                options: [.curveEaseIn, .allowUserInteraction],
                animations: {
                    tabToActivate.layer.addSublayer(borderLayer)
                    tabToActivate.setNeedsLayout()
                    tabToActivate.layoutIfNeeded()
                })
            self.itemTapped?(tab)
        }
        self.activeItem = tab
    }
    
    private func deactivateTab(tab: Int) {
        let inactiveTab = self.subviews[tab]
        let layersToRemove = inactiveTab.layer.sublayers!.filter({ $0.name == "active border" })
        
        DispatchQueue.main.async {
            UIView.animate(
                withDuration: 0.4,
                delay: 0.0,
                options: [.curveEaseIn, .allowUserInteraction],
                animations: {
                    layersToRemove.forEach({ $0.removeFromSuperlayer() })
                    inactiveTab.setNeedsLayout()
                    inactiveTab.layoutIfNeeded()
                })
        }
    }
}
