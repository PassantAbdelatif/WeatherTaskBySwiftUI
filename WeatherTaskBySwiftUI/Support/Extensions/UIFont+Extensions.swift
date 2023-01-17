//
//  UIFont+Extensions.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 16/01/2023.
//

import UIKit

extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: FontNames.SFPO.SFPOMedium,
                          size: size)
    }
}
