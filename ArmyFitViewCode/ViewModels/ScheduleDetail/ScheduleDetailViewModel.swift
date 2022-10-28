//
//  ScheduleDetailViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 27/10/22.
//

import Foundation

protocol ScheduleDetailViewModelDelegate {
    func success()
    func reloadData()
}

protocol RegisterOnTrainingDelegate {
    func showAlertAddUserOnTraining()
    func showAlertRemoveUserOnTraining()
    func success()
}

class ScheduleDetailViewModel {
    
    //MARK: - Private properties
    private let service: TrainingHoursService = .init()
    private let trainingHoursId: String
    private var isRegistered: Bool = false
    private var traininigHoursDetail: TrainingHours = .init(
        id: "",
        dateHour: "",
        spots: 0,
        availableSpots: 0,
        instructor: "",
        description: "",
        training: Training.init(
            id: "",
            name: "",
            createdAt: "",
            warning: "",
            trainingHours: nil),
        trainingId: "",
        trainingUsers: []
    )
    
    //MARK: - Public properties
    var delegate: ScheduleDetailViewModelDelegate?
    var registerDelegate: RegisterOnTrainingDelegate?
    
    //MARK: - Getters
    var getDayName: String {
        convertToUppercasedAndRemoveDotIfNecessary(Date.getDayNameFromString(date: traininigHoursDetail.dateHour))
    }
    
    var getDayNumber: String {
        Date.getDayNumberFromString(date: traininigHoursDetail.dateHour)
    }
    
    var getHourTraining: String {
        Date.formatDateStringToHour(date: traininigHoursDetail.dateHour)
    }
    
    var getMinuteTraining: String {
        Date.formatDateStringToMinute(date: traininigHoursDetail.dateHour)
    }
    
    var getCoachName: String {
        "MONITOR(A): \(traininigHoursDetail.instructor.uppercased())"
    }
    
    var getSpots: String {
        "\(getAvailableSpots()) / \(getTotalSpots())"
    }
    
    var getNumberOfUsers: Int {
        traininigHoursDetail.trainingUsers?.count ?? 0
    }
    
    init(_ trainingHoursId: String) {
        self.trainingHoursId = trainingHoursId
    }
    
    //MARK: - Public methods
    func fetchTrainingsHours(completion: @escaping () -> Void) {
        service.getTrainingHours(trainingHoursId) { trainingHours, error in
            guard let trainingHours = trainingHours else {
                return
            }
            self.traininigHoursDetail = trainingHours
            self.userIsRegistered()
            self.delegate?.reloadData()
            completion()
        }
    }
    
    func addUserOnTraining() {
        guard let userId = UserDefaults.getValue(key: UserDefaults.Keys.userId) as? String else { return }
        
        service.addUserOnTraining(trainingHoursId, userId) { _, error in
            if error != nil {
                print("Error \(error?.localizedDescription)")
            } else {
                self.registerDelegate?.success()
            }
        }
    }
    
    func removeUserOnTraining() {
        guard let userId = UserDefaults.getValue(key: UserDefaults.Keys.userId) as? String else { return }
        
        service.removeUserOnTraining(trainingHoursId, userId) { _, error in
            if error != nil {
                print("Error \(error?.localizedDescription)")
            } else {
                self.registerDelegate?.success()
            }
        }
    }
    
    func getTrainingDetailCellViewModel() -> RegisterTrainingViewModel {
        let user = traininigHoursDetail
        return RegisterTrainingViewModel(trainingDetail: user)
    }
    
    func registerButtonPressed() {
        if isRegistered {
            self.registerDelegate?.showAlertRemoveUserOnTraining()
        } else {
            self.registerDelegate?.showAlertAddUserOnTraining()
        }
    }
    
    func getRegisterButtonTitle() -> String {
        if isRegistered {
            return "SAIR DO TREINO"
        } else {
            return "PARTICIPAR DO TREINO"
        }
    }
    
    //MARK: - Private methods
    private func userIsRegistered() {
        guard let trainingUsers = traininigHoursDetail.trainingUsers else { return }
        
        let isRegistered = trainingUsers.contains { user in
            UserDefaults.getValue(key: UserDefaults.Keys.userId) as? String == user.userId
        }
        
        self.isRegistered = isRegistered
    }
    
    private func getAvailableSpots() -> String {
        return "\(traininigHoursDetail.spots)"
    }
    
    private func getTotalSpots() -> String {
        return "\(traininigHoursDetail.availableSpots)"
    }
    
    private func convertToUppercasedAndRemoveDotIfNecessary(_ text: String) -> String {
        var dayName = text
        
        if dayName.contains(".") {
            dayName.removeLast()
            return dayName.uppercased()
        }
        return dayName.uppercased()
    }
}
