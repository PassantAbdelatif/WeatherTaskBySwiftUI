//
//  Intextension.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import Foundation
extension Int {
    func timeStringFromUnixTime() -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date as Date)
    }
}
