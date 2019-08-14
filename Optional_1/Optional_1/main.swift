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




// collections

// Array - 배열 (리스트)

// Dictionary

var contacts: [String:String] = ["태완" : "01044444444", "야곰" : "010211111111", "둘리" : "010213213123"]
let tae = contacts["태완"]
contacts["럭스"] = "01021414132"
var classmates : [String : Int] = ["럭스" : 1, "징크스" : 2, "케이틀린" : 3, "트타" : 4]
classmates.removeValue(forKey : "트타") // = classmates["트타"] = nil

if let teanum : String = contacts["태완"] {
    print(teanum)
}

print("2")
print(classmates.removeValue(forKey: "dldl"))


// 타입확인
print("타입확인")
var any = 2
var another : Any = "22"
another = 3
//let result2 = any + another
//print(result2)

if let value : Int = any as? Int , let aValue : Int = another as? Int {
    let result : Int = value + aValue
    print(result)
}
