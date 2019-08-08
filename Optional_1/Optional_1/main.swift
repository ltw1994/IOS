//
//  main.swift
//  Optional_1
//
//  Created by 임태완 on 2019. 8. 6..
//  Copyright © 2019년 임태완. All rights reserved.
//

import Foundation

// optional : 값이 있을수도, 없을수도 있음

class Person {
    var name : String
    var weight : Double? = nil
    var room : Apartment?
    
    init(name : String) {
        self.name = name
    }
}

class Apartment {
    var roomNumber : Int
    var resident : Person?
    init(room : Int) {
        self.roomNumber = room
    }
}


let taewan : Person = Person(name : "taewan")
let mina : Person = Person(name : "mina")


let towerPalace : Apartment = Apartment(room : 101)

taewan.room = towerPalace
towerPalace.resident = taewan

if let room = taewan.room {
    print("\(taewan.name)의 집은 \(room.roomNumber)호입니다.")
} else {
    print("집 없음")
}

taewan.room = towerPalace
towerPalace.resident = taewan

if let room = taewan.room {
    print("\(taewan.name)의 집은 \(room.roomNumber)호입니다.")
} else {
    print("집 없음")
}


if let weight : Double? = taewan.room?.resident?.weight{
    print(weight)
}

taewan.weight = 60

if let weight : Double? = taewan.room?.resident?.weight{
    print(weight)
}

let weight : Double? = taewan.room?.resident?.weight

let name : String? = taewan.room?.resident?.name

print(weight!, name!)
