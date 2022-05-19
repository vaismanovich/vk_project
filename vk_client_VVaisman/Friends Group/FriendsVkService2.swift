//
//  FriendsVkService2.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 24/03/2022.
//




import Foundation
//ЗАНЯТИЕ ПО СЕТИ 3


enum ApiMethods: String {
    case friendsGet = "/method/friends.get"
}

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}

//enum FriendsServiceError: Error {
//    case parseError
//    case serverError
//}

class FriendsVkService2 {
    
    
    enum Constants: String {
        case scheme = "https"
        case host = "api.vk.com"
    }
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    private var singleton = Session.instance
    
    func loadFriends(completion: @escaping(Result<FriendsModel, FriendsServiceError>) -> ()) {
        
        guard let token = Session.instance.token else {return}
        
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme.rawValue
        urlComponents.host = Constants.host.rawValue
        urlComponents.path = ApiMethods.friendsGet.rawValue
      
        //params  = Query Items. Массив из UrlQueryItem
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: token),
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
//        var request = URLRequest(url: url)
//        request.httpMethod = HttpMethods.get.rawValue
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let result = try jsonDecoder.decode(FriendsModel.self, from: data)
                print(result)
                return completion(.success(result))
                
            } catch {
                completion(.failure(.parseError))
                
               
            }
            
        }
        task.resume()
    }
    
    
    
}



