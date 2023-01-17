//
//  Location.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

class Location: Codable {
    
    enum CodingKeys: String, CodingKey {
        case localtimeEpoch = "localtime_epoch"
        case region
        case name
        case localtime
        case country
        case lon
        case lat
    }
    
    var localtimeEpoch: Int?
    var region: String?
    var name: String?
    var localtime: String?
    var country: String?
    var lon: Float?
    var lat: Float?
    
    private var _localDate: Date?
    var localDate: Date? {
        
        if self._localDate != nil {
            return _localDate
        }
        self._localDate = self.localtime?.toDate(withFormat: "yyyy-MM-dd HH:mm")
        return _localDate
    }
    
    private var _localDateFormatted: String?
    var localDateFormatted: String? {
        
        if _localDateFormatted != nil {
            return _localDateFormatted
        }
        guard let from = localtime?.toAnotherDateFormat() else { return nil }
        
        self._localDateFormatted = from
        return self._localDateFormatted
    }
    
    private var _localTimeFormatted: String?
    var localTimeFormatted: String? {
        
        if _localTimeFormatted != nil {
            return _localTimeFormatted
        }
        guard let from = localtimeEpoch?.timeStringFromUnixTime() else { return nil }
        
        self._localTimeFormatted = from
        return self._localTimeFormatted
    }
}

