//
//  PreviousSearchCollectionViewCell.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 20.08.2022.
//

import UIKit

class PreviousSearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeUI()
        
    }
    
    func customizeUI() {
        avatarImageView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.white.cgColor
        
    }
    
}
