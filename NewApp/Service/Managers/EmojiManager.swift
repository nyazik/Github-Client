//
//  EmojiManager.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 17.08.2022.
//

import Foundation
import Moya

class EmojiManager {
    
    private static let provider = MoyaProvider<EmojiAPI>()
    
    static func getEmoji(completion: @escaping   (Result<[EmojiModel], Error>) -> Void) {

        provider.request(.getEmojies) { result in
            switch result {
            case .success(let response):
                let data = try! JSONDecoder().decode([String: String].self, from: response.data)
                let emojis = data.map { EmojiModel(name: $0.key, url: $0.value)}
                completion(.success(emojis))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    

}
