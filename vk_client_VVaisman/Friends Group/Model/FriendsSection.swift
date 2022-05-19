//
//  FriendsSection.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 29/03/2022.
//

import Foundation

// Создадим модель для сортировки друзей по ключу

struct FriendsSection: Comparable {
    var key: Character
    var data: [FriendModel] //Friends
    
    static func < (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key < rhs.key
    }
    
    static func == (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key == rhs.key
    }
}
