//
//  AtricleTableViewCell.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 12.08.2022.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
