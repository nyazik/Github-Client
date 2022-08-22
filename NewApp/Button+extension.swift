//
//  Button+extension.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 17.08.2022.
//


import UIKit

extension UIButton {
    func cornerRadius() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
