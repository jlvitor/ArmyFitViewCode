//
//  String+Extension.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 16/10/22.
//

import Foundation

extension String.StringInterpolation {
    
    mutating func appendInterpolation<T: CustomStringConvertible>(_ value: T?) {
        appendInterpolation(value ?? "nil" as CustomStringConvertible)
    }
}
