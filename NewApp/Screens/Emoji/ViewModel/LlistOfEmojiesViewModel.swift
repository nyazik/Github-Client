//
//  LlistOfEmojiesViewModel.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 18.08.2022.
//

import UIKit

struct MainLlistOfEmojiesViewModel {
    let emojiModel : [EmojiModel]
}

extension MainLlistOfEmojiesViewModel {


    func  numberOfRowInSection(_ sections: Int) -> Int {
        return self.emojiModel.count
    }

    var numberOfSections : Int {
        return 1
    }

    func articleAtIndex(_ index : Int) -> LlistOfEmojiesViewModel {
        let emoji  = emojiModel[index]
        return LlistOfEmojiesViewModel(emoji)
        
    }
}

struct LlistOfEmojiesViewModel {
    private let emojiModel : EmojiModel

}

extension LlistOfEmojiesViewModel {
    init(_ emojiModel : EmojiModel) {
        self.emojiModel = emojiModel
    }
}

extension LlistOfEmojiesViewModel {
    var image : String {
        self.emojiModel.url
    }
    var name : String {
        self.emojiModel.name
    }

}

