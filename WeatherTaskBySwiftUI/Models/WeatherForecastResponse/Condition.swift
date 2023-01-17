//
//  Condition.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

class Condition: Codable {
    
    enum CodingKeys: String, CodingKey {
        case icon
        case text
        case code
    }
    
    var icon: String?
    var text: String?
    var code: Int?
    
    //Info: each icon url should have https: at the begining
    //https://cdn.weatherapi.com/weather/64x64/night/122.png
    
    private var _weatherIconFullUrl: String?
    var weatherIconFullUrl: String? {
        
        if self._weatherIconFullUrl != nil {
            return _weatherIconFullUrl
        }
        if let icon  = icon,
           !icon.isEmpty {
            self._weatherIconFullUrl = "https:\(icon)"
        }
        
        return _weatherIconFullUrl
    }
}
