//
//  AvatarViewController.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 20.08.2022.
//

import UIKit
import RealmSwift

class AvatarViewController: UIViewController {

    var searchOfAvatarsVM = SearchAvatarViewModel()
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarNameLabel: UILabel!
    var searchBarQuery : String = ""
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        DispatchQueue.global().async {
            self.fetchAvatar()
        }
    }
    func customizeUI() {
        self.view.backgroundColor = .lightGray
        self.title = "Avatar Of User"
    }
    func fetchAvatar() {
        AvatarManager.getAvatars(userName: searchBarQuery.lowercased()) { [weak self] result in
            if let imageURL = result.avatar_url {
                self?.searchOfAvatarsVM.save(url: imageURL)
            }
            DispatchQueue.main.async {
                self?.avatarImageView.cl_setImage(urlString: result.avatar_url)
                self?.avatarNameLabel.text = result.login ?? "No Such User"
            }
        }
    }
    

    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
}
