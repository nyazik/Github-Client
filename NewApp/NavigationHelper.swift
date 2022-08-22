//
//  NavigationHelper.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 17.08.2022.
//

import UIKit

class NavigationHelper {
    
    static func openReposList(presenting vc: UIViewController) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Repos", bundle:nil)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "searchRepo") as! ReposViewController
        let navigationController = UINavigationController()
        navigationController.viewControllers = [secondViewController]
        navigationController.modalPresentationStyle = .fullScreen
        vc.present(navigationController, animated:false, completion:nil)

    }

    static func openEmojiList(presenting vc: UIViewController, result: [EmojiModel]) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Emojies", bundle:nil)
        let emojiListVC = storyBoard.instantiateViewController(withIdentifier: "emojiList") as! EmojiListCollectionViewController
        emojiListVC.result = result
        let navigationController = UINavigationController()
        navigationController.viewControllers = [emojiListVC]
        navigationController.modalPresentationStyle = .fullScreen
        vc.present(navigationController, animated:false, completion:nil)

    }
    
    static func openAvatar(presenting vc: UIViewController, searchBarQuery : String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SearchAvatar", bundle:nil)
        let avatarVC = storyBoard.instantiateViewController(withIdentifier: "avatarPage") as! AvatarViewController
        avatarVC.searchBarQuery = searchBarQuery
        let navigationController = UINavigationController()
        navigationController.viewControllers = [avatarVC]
        navigationController.modalPresentationStyle = .fullScreen
        vc.present(navigationController, animated:false, completion:nil)

    }
    
    static func openSavedAvatarList(presenting vc: UIViewController) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "PreviousSearch", bundle:nil)
        let previousSearchOfAvatars = storyBoard.instantiateViewController(withIdentifier: "previousSearch") as! PreviousSearchOfAvatarsCollectionViewController
        let navigationController = UINavigationController()
        navigationController.viewControllers = [previousSearchOfAvatars]
        navigationController.modalPresentationStyle = .fullScreen
        vc.present(navigationController, animated:false, completion:nil)

    }
    
}

