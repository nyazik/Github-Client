//
//  SearchBar+extension.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 17.08.2022.
//

import Foundation
import UIKit

extension UISearchBar {
    
    func customizeSearchBar() {
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
    }
}
