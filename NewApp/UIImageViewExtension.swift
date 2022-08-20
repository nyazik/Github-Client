//
//  UIImageViewExtension.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 18.08.2022.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func cl_setImage(urlString: String?, showPlaceholder: Bool = true) {
        if let imageUrlName = urlString {
            if let imageUrl = URL.init(string: imageUrlName) {
                if showPlaceholder {
                    self.sd_setImage(with: imageUrl, placeholderImage: UIImage.init(named: "noUser"))
                }
                else {
                    self.sd_setImage(with: imageUrl)
                }
            }
        } else {
            self.sd_setImage(with: nil, placeholderImage: UIImage.init(named: "noUser"))
        }
    }
}
