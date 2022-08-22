//
//  RepoService.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 19.08.2022.
//

import Foundation
import Moya

public enum RepoAPI {
    
    case getRepos
    
}

extension RepoAPI : TargetType {
    public var baseURL: URL {
        return URL.init(string: NetworkManager.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .getRepos:
            return "users/apple/repos"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "Accept-Language": "ru",
            "Accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "Accept-Encoding" : "gzip, deflate, br"
        ]
    }
    
    public var sampleData: Data {
        return Data()
    }
    
}
