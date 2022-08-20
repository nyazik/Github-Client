//
//  ReposViewModel.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 19.08.2022.
//

import Foundation
import UIKit

struct ListOfReposViewModel {
    let repoModel : [RepoModel]
}

extension ListOfReposViewModel {


    func  numberOfRowInSection(_ sections: Int) -> Int {
        return self.repoModel.count
    }

    var numberOfSections : Int {
        return 1
    }

    func articleAtIndex(_ index : Int) -> ReposViewModel {
        let emoji  = repoModel[index]
        return ReposViewModel(emoji)
        
    }
}

struct ReposViewModel {
    private let repoModel : RepoModel

}

extension ReposViewModel {
    init(_ repoModel : RepoModel) {
        self.repoModel = repoModel
    }
}

extension ReposViewModel {
    var image : String {
        self.repoModel.full_name ?? ""
    }

}

