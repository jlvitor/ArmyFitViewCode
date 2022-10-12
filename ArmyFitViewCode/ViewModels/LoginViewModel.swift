//
//  LoginViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 11/10/22.
//

import Foundation

protocol LoginViewModelDelegate {
    func successAuth()
    func errorAuth()
}

final class LoginViewModel {
    
    //MARK: - Private properties
    private let service: AuthService = .init()
    
    //MARK: - Public properties
    var delegate: LoginViewModelDelegate?
    
    //MARK: - Public method
    func makeLoginRequest(_ email: String?, _ password: String?) {
        service.authUser(
            email: getValueToValidade(email),
            password: getValueToValidade(password)) { auth, error in
                guard let auth = auth else {
                    self.delegate?.errorAuth()
                    return
                }
                
                //                self.setKeychain(with: auth)
                //                self.loadUserImageFrom(auth.user.photoUrl)
                //                self.setUserDefaultsValues(with: auth)
                self.delegate?.successAuth()
            }
    }
    
    private func getValueToValidade(_ text: String?) -> String {
        guard let text = text else { return "" }
        return text
    }
}
