//
//  FriendsVkService.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 23/03/2022.
//

import Foundation
//ЗАНЯТИЕ ПО СЕТИ 2



enum FriendsServiceError: Error {
    case parseError
    case serverError
}

class FriendsVkService {
    
    enum HttpMethods: String {
        case get = "GET"
        case post = "POST"
    }
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    private var singleton = Session.instance
    
    func loadFriends() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
      
        //params  = Query Items. Массив из UrlQueryItem
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: singleton.token),
            URLQueryItem(name: "user_id", value: String(singleton.userID ?? 0)),
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "count", value: "10"),
          //  URLQueryItem(name: "fields", value: "nickname, domain, sex, bdate, city, universities, last_seen"),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        /// Помещяем URL. Все вышестоязие компомненты во что-то одно
        guard let url = urlComponents.url else { return }
        print(url)
        
        //Request
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.get.rawValue
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:
                                                                JSONSerialization.ReadingOptions.fragmentsAllowed)
                
                print(json)
                
            } catch {
                print("")
            }
            
        }
        task.resume()
    }
    
    
    
}


