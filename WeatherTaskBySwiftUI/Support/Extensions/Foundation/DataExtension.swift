//
//  DataExtension.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import Foundation
extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}
