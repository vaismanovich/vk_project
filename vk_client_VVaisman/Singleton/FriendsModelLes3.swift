//
//  FriendsModelLes3.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 23/03/2022.
//

import Foundation


struct FriendsModel: Decodable {
    let response: ResponseFriends
}

struct ResponseFriends: Decodable {
    let count: Int
    let items: [Friends]
}

struct Friends: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo50: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
    }
}
