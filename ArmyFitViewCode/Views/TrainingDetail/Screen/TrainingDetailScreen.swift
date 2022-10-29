//
//  TrainingDetailScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/10/22.
//

import UIKit

class TrainingDetailScreen: UIView {

    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "green")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CROSSFIT"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [warningStackView, trainingStackView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var warningStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [warningTitleLabel, warningView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var warningTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Avisos"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var warningView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dark")
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var warningDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis."
        label.textColor = .white
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trainingStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [trainingTitleLabel, trainingView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var trainingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Treino"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trainingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "dark")
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var trainingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae et ullamcorper dictum arcu, egestas lorem enim morbi. Sapien euismod et gravida cras. Id lacus aliquam non lorem arcu. Consectetur in eget vel amet blandit pretium elit, quis. Urna pellentesque nullam purus enim, iaculis."
        label.textColor = .white
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrainingDetailScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(titleView)
        self.titleView.addSubview(titleLabel)
        self.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        self.warningView.addSubview(warningDescriptionLabel)
        self.trainingView.addSubview(trainingDescriptionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -12),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            warningDescriptionLabel.topAnchor.constraint(equalTo: warningView.topAnchor, constant: 12),
            warningDescriptionLabel.leadingAnchor.constraint(equalTo: warningView.leadingAnchor, constant: 12),
            warningDescriptionLabel.trailingAnchor.constraint(equalTo: warningView.trailingAnchor, constant: -12),
            warningDescriptionLabel.bottomAnchor.constraint(equalTo: warningView.bottomAnchor, constant: -12),
            
            trainingDescriptionLabel.topAnchor.constraint(equalTo: trainingView.topAnchor, constant: 12),
            trainingDescriptionLabel.leadingAnchor.constraint(equalTo: trainingView.leadingAnchor, constant: 12),
            trainingDescriptionLabel.trailingAnchor.constraint(equalTo: trainingView.trailingAnchor, constant: -12),
            trainingDescriptionLabel.bottomAnchor.constraint(equalTo: trainingView.bottomAnchor, constant: -12),
        ])
    }
}
