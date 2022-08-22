//
//  AvatarManager.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 20.08.2022.
//

import Foundation
import Moya

class AvatarManager {
    
    private static let provider = MoyaProvider<AvatarAPI>()
    
    static func getAvatars(userName : String, completion: @escaping  (AvatarModel) -> Void) {

        provider.request(.getAvatar(userName: userName)) { result in
            switch result {
            case .success(let response):
                print(response.data )
                let data = try! JSONDecoder().decode( AvatarModel.self, from: response.data as Data )
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

}
