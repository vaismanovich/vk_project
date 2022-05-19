//
//  Singleton.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 11/02/2022.
//

import UIKit



class Session {
    
    
    
    //Статичная переменная. Инициализируем класс
    static let instance = Session()
    
    
    //Приватный Инит. Позволяет запретить иницализацию класса в дальгнейгем. Его никто, нигле не смодет проинициализировать
    private init () {}
    
    
    //переменная. может прийти может нет. Соответвсвннно он опцаионалтный
    var userID: Int?
    var token: String?
    
    
    
}


//как Нам обраититься к Синглтону. Паттерну Одиночке. в Другом любом классе  в методе ViewDidLoad пишем Session.instance либо создаем из этого переменную выше
