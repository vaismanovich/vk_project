//
//  GroupsVkService.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 23/03/2022.
//

import Foundation


class GroupsVkService {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    private var singleton = Session.instance
    
    
    func loadGroupsFromVK() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.get"
        
        
        //Parameters - Query Items. Массив из UrlQueryItem
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: singleton.token),
            URLQueryItem(name: "user_id", value: String(singleton.userID ?? 0)),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "v", value: "5.124"),
        ]
        
        guard let url = urlComponents.url
        else {
            return
        }
        
        let request = URLRequest(url: url)
        
        let task  = session.dataTask(with: request) {data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
                print(json)
                
            } catch {
                print("catch")
            }
        }
        task.resume()
        
    }
    
    
}
