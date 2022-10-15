//
//  ProfileViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 13/10/22.
//

import UIKit
import KeychainSwift

protocol ComposerEmailProtocol {
    func composerEmail()
}

class ProfileViewModel {
    
    //MARK: - Private properties
    private let keychain: KeychainSwift = .init()
    
    //MARK: - Public properties
    var delegate: ComposerEmailProtocol?
    
    //MARK: - Public methods
    func countRowsInSection(at section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 1
        default:
            break
        }
        return 0
    }
    
    func profileInfo(at section: Int, at row: Int) -> ProfileCellViewModel {
        switch section {
        case 0:
            return ProfileCellViewModel(icon: UIImage(systemName: "calendar.badge.clock"), label: "Treinos agendados: 11")
        case 1:
            if row == 0 {
                return ProfileCellViewModel(icon: UIImage(systemName: "envelope.fill"), label: "Email")
            } else {
                return ProfileCellViewModel(icon: UIImage(systemName: "phone.circle.fill"), label: "WhatsApp")
            }
        default:
            return ProfileCellViewModel(icon: UIImage(systemName: "iphone.and.arrow.forward"), label: "Sair")
        }
    }
    
    func setTilteForSection(at section: Int) -> String? {
        switch section {
        case 0:
            return "Treinos"
        case 1:
            return "Entre em contato conosco"
        case 2:
            return "Logout"
        default:
            break
        }
        return nil
    }
    
    func profileOptions(at section: Int, at row: Int) {
        
        switch section {
        case 1:
            if row == 0 {
                self.delegate?.composerEmail()
            }
            if row == 1 {
                getWhatsApp()
            }
        case 2:
            if row == 0 {
                resetUserDefaultsValue()
                clearKeychain()
                setRootViewController()
            }
        default:
            break
        }
    }
    
    func createEmailUrl(to: String, subject: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
        let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)")
        let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)")
        let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)")
        
        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }
        
        return defaultUrl
    }
    
    //MARK: - Private methods
    private func getWhatsApp() {
        let countryCode = "55" //Country code
        let mobileNumber = "81993704720" //Mobile number
        let urlString = "https://api.whatsapp.com/send?phone=\(countryCode)\(mobileNumber)"
        
        guard let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let URL = NSURL(string: urlStringEncoded) else { return }
        
        if UIApplication.shared.canOpenURL(URL as URL) {
            UIApplication.shared.open(URL as URL)
        } else {
            debugPrint("Can't open")
        }
    }
    
    private func resetUserDefaultsValue() {
        UserDefaults.standard.resetAllValues()
    }
    
    private func clearKeychain() {
        keychain.clear()
    }
    
    private func setRootViewController() {
        let loginVC: LoginViewController = .init()
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(loginVC)
    }
}
