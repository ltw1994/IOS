//
//  MyInfo.swift
//  SignUp
//
//  Created by 임태완 on 2019. 8. 8..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class MyInfo: NSObject {
    
    var id : String?
    var password : String?
    var passwordConfirm : String?
    
    var date : String?
    var phoneNumber : String?
    var saveDateString : String?
    
    var pickerDate : Date?
    var valueChange : String?
    
    static let shared : MyInfo = MyInfo() //
    
}
