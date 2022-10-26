//
//  ScheduleScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 16/10/22.
//

import UIKit

class ScheduleScreen: UIView {

    private lazy var dateCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.backgroundColor = UIColor(named: "light")
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerCell(type: DateCell.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        return collectionView
    }()
    
    lazy var scheduleTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(named: "light")
        table.bounces = false
        table.showsVerticalScrollIndicator = false
        table.rowHeight = UITableView.automaticDimension
        table.registerCell(type: ScheduleCell.self)
        table.separatorStyle = .none
        table.overrideUserInterfaceStyle = .dark
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configAllDelegates(
        collectionDelegate: UICollectionViewDelegate,
        collectionDataSource: UICollectionViewDataSource,
        tableDelegate: UITableViewDelegate,
        tableDataSource: UITableViewDataSource) {
        dateCollectionView.delegate = collectionDelegate
        dateCollectionView.dataSource = collectionDataSource
        scheduleTableView.delegate = tableDelegate
        scheduleTableView.dataSource = tableDataSource
    }
}

extension ScheduleScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(dateCollectionView)
        self.addSubview(scheduleTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dateCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            dateCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dateCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dateCollectionView.heightAnchor.constraint(equalToConstant: 104),
            
            scheduleTableView.topAnchor.constraint(equalTo: dateCollectionView.bottomAnchor),
            scheduleTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scheduleTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scheduleTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
