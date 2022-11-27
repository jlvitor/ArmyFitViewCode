//
//  CommentsViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 07/11/22.
//

import UIKit

class CommentsViewController: BaseViewController {
    
    private var commentsScreen: CommentsScreen?
    private var commentBoxBottomIdentity = CGFloat()
    
    var viewModel: CommentsViewModel?
    
    override func loadView() {
        super.loadView()
        self.commentsScreen = CommentsScreen()
        self.commentsScreen?.configUser(viewModel!)
        self.commentsScreen?.commentsTableView.dataSource = self
        self.commentsScreen?.configDelegate(self)
        self.view = commentsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func configBackgroundColor() {
        self.view.backgroundColor = UIColor(named: "dark")
    }
    
    private func configViewModel() {
        viewModel?.delegate = self
        viewModel?.newCommentDelegate = self
        viewModel?.fetchPost()
    }
    
    private func configNotificationCenter() {
        
    }
    
    private func empityAlert() {
        let error = UIAlertController(
            title: "Opa, tem algo estranho!",
            message: "Parece que você esqueceu de alguma coisa, que tal escrever uma mensagem para seus colegas de treino?",
            preferredStyle: .alert)
        
        let confirm = UIAlertAction(
            title: "OK",
            style: .cancel)
        
        error.addAction(confirm)
        present(error, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfComments ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commentCell = tableView.dequeueCell(withType: CommentsCell.self, for: indexPath) as? CommentsCell else {
            return UITableViewCell()
        }
        
        if let cellViewModel = viewModel?.getCommentCellViewModel(at: indexPath.row) {
            commentCell.configUserLabel(cellViewModel)
        }
        
        commentCell.backgroundColor = .clear
        
        return commentCell
    }
}

// MARK: - CommentsViewModelDelegate
extension CommentsViewController: CommentsViewModelDelegate {
    func errorGetComments() {
        print("error")
    }
}

// MARK: - NewCommentDelegate
extension CommentsViewController: NewCommentDelegate {
    func commentSuccess() {
        viewModel?.fetchPost()
    }
    
    func empityComment() {
        empityAlert()
    }
    
    func reloadData() {
        commentsScreen?.commentsTableView.reloadData()
    }
}

// MARK: - NewCommentProtocol
extension CommentsViewController: NewCommentProtocol {
    func sendCommentButtonAction() {
        guard let commentsScreen = commentsScreen else { return }
        
        viewModel?.makeAComment(with: commentsScreen.commentsBox.text)
    }
}
