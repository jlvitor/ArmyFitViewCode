//
//  CommentsScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 07/11/22.
//

import UIKit
import Kingfisher

protocol NewCommentProtocol: AnyObject {
    func sendCommentButtonAction()
}

class CommentsScreen: UIView {
    
    private weak var delegate: NewCommentProtocol?
    private var bottomConstraints: NSLayoutConstraint?
    private var heightConstraints: NSLayoutConstraint?

    private lazy var topStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userImageView, detailStackView])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var detailStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userNameLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Glória"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "18 mai 2022 17:00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus in vel non at scelerisque enim tempor, ipsum. Facilisis porttitor mattis hendrerit lectus. Ullamcorper scelerisque nunc tempor vulputate nibh nunc. Pretium, risus massa a vitae in sapien ultrices."
        label.textColor = .white
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var commentsTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(named: "light")
        table.bounces = false
        table.showsVerticalScrollIndicator = false
        table.rowHeight = UITableView.automaticDimension
        table.registerCell(type: CommentsCell.self)
        table.separatorStyle = .none
        table.overrideUserInterfaceStyle = .dark
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var commentsBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var commentsBox: UITextView = {
        let txt = UITextView()
        txt.delegate = self
        txt.text = "Adicione um comentário..."
        txt.textColor = .lightGray
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.autocapitalizationType = .sentences
        txt.backgroundColor = UIColor(named: "dark")
        txt.tintColor = UIColor(named: "light")
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 8
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    private lazy var sendCommentButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        btn.tintColor = UIColor(named: "green")
        btn.addTarget(self, action: #selector(tappedCommentButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func configUser(_ viewModel: CommentsViewModel) {
        userImageView.kf.setImage(with: URL(string: viewModel.getUserImage))
        userNameLabel.text = viewModel.getUserName
        postLabel.text = viewModel.getPost
    }
    
    func configDelegate(_ delegate: NewCommentProtocol) {
        self.delegate = delegate
    }
    
    @objc private func tappedCommentButton() {
        self.delegate?.sendCommentButtonAction()
    }
    
    @objc private func handleKeyboardNotification(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification

            self.bottomConstraints?.constant = isKeyboardShowing ? -keyboardHeight : 0
            self.commentsTableView.center.y = isKeyboardShowing ?
            self.commentsTableView.center.y-keyboardHeight :
            self.commentsTableView.center.y+keyboardHeight
            
            UIView.animate(
                withDuration: 0.1,
                delay: 0,
                options: .curveEaseOut, animations: {
                self.layoutIfNeeded()
            }, completion: { completed in
                //Config!!!
            })
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommentsScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(topStackView)
        self.addSubview(postLabel)
        self.addSubview(commentsTableView)
        self.addSubview(commentsBoxView)
        self.commentsBoxView.addSubview(commentsBox)
        self.commentsBoxView.addSubview(sendCommentButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            userImageView.topAnchor.constraint(equalTo: topStackView.topAnchor, constant: 12),
            userImageView.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor, constant: 12),
            userImageView.bottomAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: -12),
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            
            postLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
            postLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            postLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            postLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            commentsTableView.topAnchor.constraint(equalTo: postLabel.bottomAnchor),
            commentsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            commentsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            commentsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            commentsBoxView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            commentsBoxView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            commentsBoxView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            commentsBox.topAnchor.constraint(equalTo: commentsBoxView.topAnchor, constant: 12),
            commentsBox.leadingAnchor.constraint(equalTo: commentsBoxView.leadingAnchor, constant: 12),
            commentsBox.bottomAnchor.constraint(equalTo: commentsBoxView.bottomAnchor, constant: -12),
            commentsBox.heightAnchor.constraint(equalToConstant: 35),
            
            sendCommentButton.leadingAnchor.constraint(equalTo: commentsBox.trailingAnchor, constant: 12),
            sendCommentButton.trailingAnchor.constraint(equalTo: commentsBoxView.trailingAnchor, constant: -12),
            sendCommentButton.bottomAnchor.constraint(equalTo: commentsBox.bottomAnchor),
            sendCommentButton.heightAnchor.constraint(equalToConstant: 35),
            sendCommentButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func applyAdditionalChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.bottomConstraints = NSLayoutConstraint(
            item: self.commentsBoxView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1,
            constant: 1)
        
        self.heightConstraints = NSLayoutConstraint(
            item: self.commentsBox,
            attribute: .height,
            relatedBy: .lessThanOrEqual,
            toItem: self,
            attribute: .height,
            multiplier: 1,
            constant: 1)
        
        self.addConstraint(bottomConstraints ?? NSLayoutConstraint())
        self.addConstraint(heightConstraints ?? NSLayoutConstraint())
    }
}

extension CommentsScreen: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            commentsBox.text = ""
            commentsBox.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            commentsBox.text = "Adicione um comentário..."
            commentsBox.textColor = .lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.heightConstraints?.constant = textView.contentSize.height
    }
}
