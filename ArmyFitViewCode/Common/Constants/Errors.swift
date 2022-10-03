//
//  Errors.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import Foundation

enum ServiceError: Error {
    case parseError
    case statusCode(Int)
    case badRequest
}
