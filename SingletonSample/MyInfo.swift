//
//  MyInfo.swift
//  SingletonSample
//
//  Created by 임태완 on 2019. 8. 8..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class MyInfo: NSObject {
    
    var name : String?
    var age : String?
    
    static let shared : MyInfo = MyInfo() // 

}
