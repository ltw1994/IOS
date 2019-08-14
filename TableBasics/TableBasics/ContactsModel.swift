//
//  ContactsModel.swift
//  TableBasics
//
//  Created by 임태완 on 2019. 8. 12..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class Person : NSObject {
    var name : String
    var mobile : String
    
    init(name : String, mobile : String) {
        self.name = name
        self.mobile = mobile
    }
}
class ContactsModel: NSObject {

    var friends : [Person] = []
    
    override init() {
        super.init()
        
        friends.append(Person.init(name : "럭스", mobile : "121313"))
        friends.append(Person.init(name : "징크스", mobile : "213123132"))
        friends.append(Person.init(name : "라이즈", mobile : "515213213"))
        friends.append(Person.init(name : "케이틀린", mobile : "123213192489"))
        friends.append(Person.init(name : "빅토르", mobile : "213124213"))
        friends.append(Person.init(name : "아지르", mobile : "12313312"))
        friends.append(Person.init(name : "리븐", mobile : "19821412"))
        friends.append(Person.init(name : "피오라", mobile : "21314213"))
        friends.append(Person.init(name : "럼블", mobile : "1241235511"))
        friends.append(Person.init(name : "미스포츈", mobile : "99213"))
        friends.append(Person.init(name : "피즈", mobile : "213214121321"))
        friends.append(Person.init(name : "베인", mobile : "9919992"))
        friends.append(Person.init(name : "엘리스", mobile : "21321431"))
        friends.append(Person.init(name : "카서스", mobile : "66166"))
        friends.append(Person.init(name : "에코", mobile : "17171641"))


    }
    
    
    
    
}
