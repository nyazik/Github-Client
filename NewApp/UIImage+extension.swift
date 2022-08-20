//
//  UIImage+extension.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 19.08.2022.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        self.init(data: imageData)
    }
}
