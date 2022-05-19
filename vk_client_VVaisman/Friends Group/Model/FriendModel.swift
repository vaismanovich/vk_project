//
//  FriendModel.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 29/03/2022.
//

import Foundation
import UIKit
// Создадим модель для добавлении друзей в массив друзей
struct FriendModel {
    let name: String
    let image: String
    let uiImage: UIImage
    var friendsPhoto: [UIImage] = []
    
    init(name: String, image: String, friendsPhoto: [String]) {
        self.name = name
        self.image = image
        
        uiImage = UIImage(named: image) ?? UIImage()
        
        // массив фоток друзей из имен фоток
        for friendsPhoto in friendsPhoto {
            guard let image = UIImage(named: friendsPhoto) else {continue}
            self.friendsPhoto.append(image)
        }
    }
}
