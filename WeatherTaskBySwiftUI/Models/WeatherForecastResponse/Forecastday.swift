//
//  Forecastday.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

protocol checkIfDateIdFriday {
    mutating func checkIfDateIsFriday()
}

class Forecastday: Codable {
    
    enum CodingKeys: String, CodingKey {
        case dateEpoch = "date_epoch"
        case day
        case date
    }
    
    var dateEpoch: Int?
    var day: Day?
    var date: String?
    
    
    private var _isFriday: Bool?
    var isFriday: Bool? {
        
        if self._isFriday != nil {
            return _isFriday
        }
        if let date = self.date?.toDate() {
            if date.getWeekDay() == .friday {
                _isFriday = true
            }
        }
        return _isFriday
    }
    
    private var _isToday: Bool?
    var isToday: Bool? {
        
        if self._isToday != nil {
            return _isToday
        }
        if let date = self.date?.toDate() {
            _isToday = date.isToday
        }
        return _isToday
    }
    
    private var _isTomorrow: Bool?
    var isTomorrow: Bool? {
        
        if self._isTomorrow != nil {
            return _isTomorrow
        }
        if let date = self.date?.toDate() {
            _isTomorrow = date.isTomorrow
        }
        return _isTomorrow
    }
}

