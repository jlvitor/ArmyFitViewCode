//
//  ProfileViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit
import MessageUI

class ProfileViewController: UIViewController {
    
    private var profileScreen: ProfileScreen?
    private let viewModel: ProfileViewModel = .init()
    
    override func loadView() {
        super.loadView()
        self.profileScreen = ProfileScreen()
        self.profileScreen?.delegateTableView(delegate: self, dataSource: self)
        self.view = self.profileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupNavigationBar()
        viewModel.delegate = self
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "green")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Perfil"
        navigationController?.navigationBar.backgroundColor = UIColor(named: "green")
        
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .compose,
            target: self,
            action: #selector(barButtonTapped))
        
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc private func barButtonTapped() {
        print("Teste")
    }
}

//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        viewModel.profileOptions(at: section, at: row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countRowsInSection(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueCell(withType: ProfileCell.self, for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.profileInfo(at: indexPath.section, at: indexPath.row)
        profileCell.selectionStyle = .none
        profileCell.backgroundColor = .clear
        profileCell.configure(with: cellViewModel)
        
        return profileCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.setTilteForSection(at: section)
    }
}

// MARK: - ComposerEmailProtocol
extension ProfileViewController: ComposerEmailProtocol {
    func composerEmail() {
        let recipientEmail = "recepcaoarmyclf@gmail.com"
        let subject = "ArmyFit - Suporte ao cliente"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipientEmail])
            mail.setSubject(subject)
            
            present(mail, animated: true)
            
        } else if let emailUrl = viewModel.createEmailUrl(to: recipientEmail, subject: subject) {
            UIApplication.shared.open(emailUrl)
        }
    }
}

// MARK: - MFMailComposeViewControllerDelegate
extension ProfileViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
