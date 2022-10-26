//
//  SchedulesViewModel.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 16/10/22.
//

import UIKit

protocol SchedulesViewModelDelegate {
    func reloadData()
}

class SchedulesViewModel {
    
    //MARK: - Private properties
    private let service: TrainingHoursService = .init()
    private var trainingHoursList: [TrainingHours] = []
    
    //MARK: - Public properties
    var delegate: SchedulesViewModelDelegate?
    var trainingDays: [(String, String)] = []
    var cellSelected: Int = 0
    var date: String? = Date.getCurrentDateToDateString()
    
    //MARK: - Getter
    var trainingHoursCount: Int {
        trainingHoursList.count
    }
    
    //MARK: - Public methods
    func fetchTrainingsHours(_ date: String) {
        service.getAllTrainingHours(date) { success, error in
            guard let success = success else {
                return
            }
            
            self.trainingHoursList = self.sortedDate(success)
            self.delegate?.reloadData()
        }
    }
    
    func getDayCellViewModel(_ index: Int) -> DayViewModel {
        let daysSorted = trainingDays.sorted {$0.0 < $1.0 }
        let day = daysSorted[index]
        return DayViewModel(trainingDay: day)
    }
    
    func getTrainingCellViewModel(_ index: Int) -> ScheduleViewModel {
        let training = trainingHoursList[index]
        return ScheduleViewModel(training)
    }
    
    func getDayStringToDateString(_ day: String) -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let monthFormatted = String(format: "%02d", month)
        
        let dateFormatted = String("\(year)-\(monthFormatted)-\(day)")
        return dateFormatted
    }
    
    func getRemainingDaysInAMonth() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)
        
        let range = calendar.range(of: .day, in: .month, for: currentDate)
        
        range?.forEach { day in
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: "\(year)/\(month)/\(day)") {
                if day >= currentDay {
                    dateFormatter.dateFormat = "EEE"
                    let dayName = dateFormatter.string(from: date)
                    let dayFormatted = String(format: "%02d", day)
                    trainingDays.append((dayFormatted, dayName))
                }
            }
        }
    }
    
    func configCellBackgroundColorWhenSelected(_ cell: DateCell?, at index: Int) {
        if index == cellSelected {
            cell?.backgroundColor = UIColor(named: "green")
        } else {
            cell?.backgroundColor = UIColor(named: "dark")
        }
    }
    
    //MARK: - Private method
    private func sortedDate(_ hours: [TrainingHours]) -> [TrainingHours] {
        let dateFormatter = DateFormatter()
        
        let hours = hours.sorted(by: { firstDate, secondDate in
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let saveFirstDate = dateFormatter.date(from: firstDate.dateHour)
            let saveSecondDate = dateFormatter.date(from: secondDate.dateHour)
            
            guard let saveFirstDate = saveFirstDate,
                  let saveSecondDate = saveSecondDate else { return false }
            return saveFirstDate < saveSecondDate
        })
        return hours
    }
}
