//
//  FactoryForEmojies.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 19.08.2022.
//

import Foundation
import UIKit

class MainViewViewModel {
    
    var listOfEmojis: [EmojiModel] = []
    
    func randomEmoji() -> String {
        let randomIndex = Int.random(in: 0..<listOfEmojis.count)
        let imageByIndex = listOfEmojis[randomIndex].url
        return imageByIndex
    }
    
    var searchBarText : String = ""
}
