//
//  EmojiCellCollectionViewCell.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 18.08.2022.
//

import UIKit
import SDWebImage

class EmojiCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var emojiImageView: UIImageView!
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeUI()
        
    }
    
    func customizeUI() {
        emojiImageView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.white.cgColor
        
    }
    
}
