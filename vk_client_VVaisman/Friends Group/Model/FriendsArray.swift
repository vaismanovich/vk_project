//
//  UserFriendlyArray.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 27/01/2022.
//

import Foundation
import UIKit

class FriendsArray {
    
    
    static var friends = [FriendModel(name: "Alon", image: "Alon", friendsPhoto: ["Alon"]),
                          FriendModel(name: "Max", image: "Max", friendsPhoto: ["Max"]),
                           FriendModel(name: "Yura", image: "Yura", friendsPhoto: ["Yura"]),
                            FriendModel(name: "Kostya", image: "Kostya", friendsPhoto: ["Kostya"])]
                          
    
    static func iNeedFriends() -> [FriendsSection] {
        let sortedArray = sortFriends(friends)
        let sectionsArray = formFriendsSection(sortedArray)
        return sectionsArray
    }
    
    // Разбираем друзей по ключамБ в зависимости от первой буквы
    static func sortFriends(_ array: [FriendModel]) -> [Character: [FriendModel]] {
        var newArray: [Character: [FriendModel]] = [:]
        for friend in array {
            // проверяемБ чтобы строка имени не оказалась пустой
            guard let firstChar = friend.name.first else {
                continue
            }
            
            // если такого ключа нет, то создадим секцию с этим ключом
            guard var array = newArray[firstChar] else {
                let newValue = [friend]
                newArray.updateValue(newValue, forKey: firstChar)
                continue
            }
            
            // если секция нашлась то добавим в массив ещёё одну модель
            array.append(friend)
            newArray.updateValue(array, forKey: firstChar)
        }
        return newArray
    }
    
    static func formFriendsSection(_ array: [Character: [FriendModel]]) -> [FriendsSection] {
        var sectionArray: [FriendsSection] = []
        for (key, array) in array {
            sectionArray.append(FriendsSection(key: key, data: array))
        }
        
        // сортируем секции по алфавиту
        sectionArray.sort {$0 < $1}
        
        return sectionArray
    }
}
    
    
   
    
    
    
    
    



