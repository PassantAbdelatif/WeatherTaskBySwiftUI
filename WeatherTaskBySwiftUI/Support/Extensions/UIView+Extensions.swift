//
//  UIView+Extensions.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 15/01/2023.
//

import SwiftUI
public extension View {
    func fullBackground(imageName: String) -> some View {
        return  Image(imageName)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        
    }
    func propotionalFrame(width: CGFloat, height: CGFloat, isSquared: Bool = false, alignment: Alignment = .center) -> some View {
        let finalWidth = UIScreen.main.bounds.width * width
        let finalHeight = isSquared ? finalWidth : UIScreen.main.bounds.height * height
        return frame(width: finalWidth, height: finalHeight)
    }
}

//Custom Alignment Guide
extension HorizontalAlignment {
    enum SubCenter: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    
    static let subCentre = HorizontalAlignment(SubCenter.self)
}
