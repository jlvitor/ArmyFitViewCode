//
//  PostViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 02/11/22.
//

import UIKit

class PostViewController: UIViewController {
    
    private var postScreen: PostScreen?
    private let viewModel: NewPostViewModel = .init()

    //MARK: - Init`s
    override func loadView() {
        super.loadView()
        super.loadView()
        self.postScreen = PostScreen()
        self.postScreen?.configureDelegate(self, self)
        self.postScreen?.configUserLabel(viewModel)
        self.view = self.postScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
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
    
    //MARK: - Private methods
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "light")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Criar publicação"
        navigationController?.navigationBar.tintColor = .white
        
        let barButtonItem = UIBarButtonItem(customView: postScreen?.publishButton ?? UIView())
        let currWidth = barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 80)
        currWidth?.isActive = true
        
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    private func configViewModel() {
        viewModel.delegate = self
    }
    
    private func errorAlert() {
        let error = UIAlertController(
            title: "Não foi possível fazer a postagem",
            message: "Opss, não foi possível fazer sua postagem agora, tente novamente mais tarde!",
            preferredStyle: .alert)
        
        let confirm = UIAlertAction(
            title: "OK",
            style: .cancel) { action in
                self.navigationController?.popViewController(animated: true)
        }
        
        error.addAction(confirm)
        present(error, animated: true)
    }
}

// MARK: - PostScreenProtocol
extension PostViewController: PostScreenProtocol {
    func makeNewPost() {
        viewModel.makeNewPost(description: postScreen?.getPostDescription())
    }
}

// MARK: - UITextViewDelegate
extension PostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "No que você está pensando?"
            textView.textColor = .lightGray
        }
    }
}

// MARK: - NewPostViewModelDelegate
extension PostViewController: NewPostViewModelDelegate {
    func successMakeNewPost() {
        navigationController?.popViewController(animated: true)
    }
    
    func errorMakeNewPost() {
        errorAlert()
    }
}
