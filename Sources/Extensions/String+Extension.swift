//
//  String+Extension.swift
//  
//
//  Created by Semih Ozsoy on 27.09.2023.
//

import Foundation

public extension String {
    
    var date: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: Locale.current.languageCode ?? "en")
        guard let date = formatter.date(from: self) else {
            return nil
        }
        return date.localDate()
    }
}
