//
//  MainViewController.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 17.08.2022.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    private let mainVM = MainViewViewModel()
    @IBOutlet weak var randomEmojiButton: UIButton!
    @IBOutlet weak var emojiListButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var avatarListButton: UIButton!
    @IBOutlet weak var appleReposButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var randomImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        fetchEmojies()
        customizeUI()
    }
    
    func customizeUI() {
        if searchBar.text == "" {
            searchButton.isEnabled = false
        } else {
            searchButton.isEnabled = true
        }
        randomEmojiButton.cornerRadius()
        emojiListButton.cornerRadius()
        searchButton.cornerRadius()
        avatarListButton.cornerRadius()
        appleReposButton.cornerRadius()
        searchBar.customizeSearchBar()
        searchBar.placeholder = "Search Avatars"
    }
    
    func fetchEmojies() {
        EmojiManager.getEmoji { result in
            self.mainVM.listOfEmojis = result
        }
    }
    
    @IBAction func appleReposButtonTapped(_ sender: Any) {
        NavigationHelper.openReposList(presenting: self)
    }
    
    @IBAction func emojiListButtonTapped(_ sender: Any) {
        NavigationHelper.openEmojiList(presenting: self, result: self.mainVM.listOfEmojis)
    }
    
    @IBAction func randomEmojiButtonTapped(_ sender: Any) {
        let urlOfEmoji = mainVM.randomEmoji()
        randomImageView.cl_setImage(urlString: urlOfEmoji)
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        searchBar.text = ""
        NavigationHelper.openAvatar(presenting: self, searchBarQuery: self.mainVM.searchBarText)
    }
    
    @IBAction func avatarListButtonTapped(_ sender: Any) {
        NavigationHelper.openSavedAvatarList(presenting: self)
    }
    
}

//MARK: - UITextFieldDelegate
extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            searchButton.isEnabled = true
            mainVM.searchBarText = searchText
        } else {
            searchButton.isEnabled = false
        }

    }

}
