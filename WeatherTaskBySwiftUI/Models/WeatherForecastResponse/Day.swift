//
//  Day.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

class Day: Codable {

  enum CodingKeys: String, CodingKey {

    case condition
    case mintempF = "mintemp_f"
    case maxtempF = "maxtemp_f"
  }


  var condition: Condition?
  var mintempF: Float?
  var maxtempF: Float?
    
    
    private var _dayTempFRange: String?
    var dayTempFRange: String? {
        
        if self._dayTempFRange != nil {
            return _dayTempFRange
        }
        if let maxTempF  = maxtempF,
        let minTempF = mintempF {
            self._dayTempFRange = "\(minTempF)°/\(maxTempF)°F"
        }
        return _dayTempFRange
    }

}
