//
//  Date+Extension.swift
//  
//
//  Created by Semih Ozsoy on 28.09.2023.
//

import Foundation

public extension Date {
    func localDate() -> Date {
        guard let localDate = Calendar.current.date(
            byAdding: .second,
            value: 0,
            to: self) else {
            return self
        }
        return localDate
    }
}
