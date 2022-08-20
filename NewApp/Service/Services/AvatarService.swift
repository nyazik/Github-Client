//
//  AvatarService.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 20.08.2022.
//

import Foundation
import Moya

public enum AvatarService {
    
    case getAvatar(userName : String)
    
}

extension AvatarService : TargetType {
    public var baseURL: URL {
        return URL.init(string: NetworkManager.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .getAvatar(let userName):
            return "users/\(userName)"
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
