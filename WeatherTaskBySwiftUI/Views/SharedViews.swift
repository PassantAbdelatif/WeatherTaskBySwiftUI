//
//  SharedViews.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 17/01/2023.
//

import SwiftUI


struct WeatherOfTheDay: View {
    
    var weatherImage: String
    var weatherTemp: String
    var weatherDay: String
    
    var body: some View {
        VStack (spacing: 6) {
            ImageWithURLView(urlStringValue: weatherImage ,
                             width: 32,
                             height: 32)
            
            MediumTextLabel(mediumText: weatherTemp,
                            mediumSize: 12)
            
            BoldTextLabel(boldText: weatherDay,
                          boldSize: 12)
            
        }
    }
}

struct MediumTextLabel: View {
    
    var mediumText: String
    var mediumSize: Int
    var textColor: Color = .white
    
    var body: some View {
        Text(mediumText)
            .font(.custom(FontNames.SFPO.SFPOMedium,
                          size: CGFloat(mediumSize)))
            .foregroundColor(textColor)
            .frame(alignment: .center)
    }
}

struct BoldTextLabel: View {
    
    var boldText: String
    var boldSize: Int
    var textColor: Color = .white
    
    var body: some View {
        Text(boldText)
            .font(.custom(FontNames.SFPO.SFPOBold,
                          size: CGFloat(boldSize)))
            .foregroundColor(textColor)
            .frame(alignment: .center)
    }
}

struct ImageWithURLView: View {
    
    var urlStringValue: String
    var width: Int
    var height: Int
    
    var body: some View {
        AsyncImage(
            url: URL(string: urlStringValue),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: CGFloat(width),
                           maxHeight: CGFloat(height))
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

struct ImageWithAssetName: View {
    
    var imageName: String
    var width: Int
    var height: Int
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: CGFloat(width),
                   height: CGFloat(height))
    }
}

