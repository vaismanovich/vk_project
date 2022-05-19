////
////  FriendsServicemanagerU3.swift
////  vk_client_VVaisman
////
////  Created by Vitaliy on 29/03/2022.
////
//
//import Foundation
//import UIKit
//
//
//// Image manager - сущность которая будет все красиво конвертить в данные
//
//class FriendsServicemanager {
//    
//    private var service = FriendsVkService2()
//    private var imageService = ImageLoader()
//    
//    // Конвертануть данные с одного типа в лругой. в Друзтях стоит разлеление по секциям
//    func loadFriends(completion: @escaping([FriendsSection])-> Void) {
//        service.loadFriends { [weak self] result in
//            guard let self = self else {return}
//            switch result {
//            case .success(let friend):
//                let section = self.formFriendsArray(from: friend.response.items)
//                completion(section)
//           
//            case .failure(_):
//                print("error")
//            }
//        }
//    }
//    
//    func loadImage(url: String, completion: @escaping(UIImage) -> Void) {
//        guard let url = URL(string: url) else {return}
//        // Передаеи Url. Выполняем completion
//        imageService.loadImage(url: url) { result in
//            switch result {
//            case .success(let data):
//                //у UiImage есть инициализатор с типом Дата
//                guard let image = UIImage(data: data) else {return}
//                completion(image)
//                
//            case .failure(_):
//                print("error")
//            }
//        }
//    }
//}
//
//
//
//private extension FriendsServicemanager {
//    
//    func formFriendsArray(from array:[Friends]?) -> [FriendsSection] {
//        guard let array = array else {return []}
//        let sort = sortFriends(array)
//        return formFriendsSection(sort)
//    }
//    
//    
//    
//    // Разбираем друзей по ключамБ в зависимости от первой буквы
//    func sortFriends(_ array: [Friends]) -> [Character: [Friends]] {
//        var newArray: [Character: [Friends]] = [:]
//        for friend in array {
//            // проверяемБ чтобы строка имени не оказалась пустой
//            guard let firstChar = friend.firstName.first else {
//                continue
//            }
//            
//            // если такого ключа нет, то создадим секцию с этим ключом
//            guard var array = newArray[firstChar] else {
//                let newValue = [friend]
//                newArray.updateValue(newValue, forKey: firstChar)
//                continue
//            }
//            
//            // если секция нашлась то добавим в массив ещёё одну модель
//            array.append(friend)
//            newArray.updateValue(array, forKey: firstChar)
//        }
//        return newArray
//    }
//    
//    func formFriendsSection(_ array: [Character: [Friends]]) -> [FriendsSection] {
//        var sectionArray: [FriendsSection] = []
//        for (key, array) in array {
//            sectionArray.append(FriendsSection(key: key, data: array))
//        }
//        
//        // сортируем секции по алфавиту
//        sectionArray.sort {$0 < $1}
//        
//        return sectionArray
//    }
//}
//
//
