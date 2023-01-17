//
//  UImage+ImageUrl.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func loadImageFromUrl(_ urlStr: String?,
                          placeholderImage: UIImage? = nil,
                          completion: (() -> Void)? = nil) {
        if let url = URL(string: urlStr ?? "") {
            self.sd_setImage(with: url,
                             placeholderImage: placeholderImage) { _,_,_,_  in
                                completion?()
            }
        }
    }
}
