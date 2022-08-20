//
//  PreviousSearchOfAvatarsViewModel.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 20.08.2022.
//

import Foundation
import RealmSwift
import UIKit

struct PreviousSearchOfAvatarsViewModel {
    var savedAvatarsModel : Results<SavesAvatarsModel>
}

extension PreviousSearchOfAvatarsViewModel {
    
    func  numberOfRowInSection(_ sections: Int) -> Int {
        return self.savedAvatarsModel.count
    }

    var numberOfSections : Int {
        return 1
    }

    func articleAtIndex(_ index : Int) -> SearchOfAvatarsViewModel {
        let emoji  = savedAvatarsModel[index]
        return SearchOfAvatarsViewModel(emoji)
        
    }
    
}

struct SearchOfAvatarsViewModel {
    private let savedAvatarsModel : SavesAvatarsModel

}

extension SearchOfAvatarsViewModel {
    init(_ savedAvatarsModel : SavesAvatarsModel) {
        self.savedAvatarsModel = savedAvatarsModel
    }
}

extension SearchOfAvatarsViewModel {
    var image : String {
        self.savedAvatarsModel.avatarURL
    }
}

