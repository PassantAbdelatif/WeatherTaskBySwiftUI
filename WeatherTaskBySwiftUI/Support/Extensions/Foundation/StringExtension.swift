//
//  StringExtension.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/01/2023.
//

import Foundation
extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd")-> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
    func toAnotherDateFormat(fromFormat format: String = "yyyy-MM-dd HH:mm",
                             toFormat otherFormat: String = "EEEE, d MMM yyyy")-> String? {
        let formatter = DateFormatter()
        formatter.locale = Locale.englishLocale
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        if let date = formatter.date(from: self) {
            formatter.dateFormat = otherFormat
            return  formatter.string(from: date)
        }
        return nil
    }
}
