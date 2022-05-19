//
//  UserFriedly.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 27/01/2022.
//

import Foundation
import UIKit

class UserCustomClass {
    
    var name: String
    var imageName: String
    
    init(name:String,imageName: String) {
        self.name = name
        self.imageName = imageName
    }
   
}

extension UserCustomClass: Comparable {
    static func == (lhs: UserCustomClass, rhs: UserCustomClass) -> Bool {
    return lhs.name == rhs.name
    }
    
    static func < (lhs: UserCustomClass, rhs: UserCustomClass) -> Bool {
       return lhs.name < rhs.name
    }
    
}
