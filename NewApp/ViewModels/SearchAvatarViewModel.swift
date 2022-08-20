//
//  SearchAvatarViewModel.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 20.08.2022.
//

import Foundation
import RealmSwift

struct SearchAvatarViewModel {
    
    let realm = try! Realm()
    
    func save(url : String) {
        let img = SavesAvatarsModel()
        img.avatarURL = url
        do {
            try realm.write {
                realm.add(img)
            }
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
    
    
}
