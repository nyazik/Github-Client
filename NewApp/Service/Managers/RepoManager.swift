//
//  RepoManager.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 19.08.2022.
//

import Foundation
import Moya

class RepoManager {
    
    private static let provider = MoyaProvider<RepoAPI>()
    
    static func getRepos(completion: @escaping  (Result<[RepoModel], Error>) -> Void) {

        provider.request(.getRepos) { result in
            switch result {
            case .success(let response):
                print(response.data )
                let data = try! JSONDecoder().decode( [RepoModel].self, from: response.data as Data )
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    

}
