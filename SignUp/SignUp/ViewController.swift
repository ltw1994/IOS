//
//  ViewController.swift
//  SignUp
//
//  Created by 임태완 on 2019. 8. 6..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idLabel : UITextField!
    @IBOutlet weak var passwordLabel : UITextField!
   // @IBOutlet weak var passwordConfirmLabel : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if MyInfo.shared.id != nil {
            self.idLabel.text = MyInfo.shared.id

        }
        
        self.idLabel.text = MyInfo.shared.id
 //       self.passwordLabel.text = MyInfo.shared.password
    //    self.passwordConfirmLabel.text = MyInfo.shared.passwordConfirm
        
    }
    
    @IBAction func clear() {
        let clear_id : String? = nil
//        let clear_password : String? = nil
        let clear_phoneNumber : String? = nil
        let clear_dateLabel : String? = nil
        let clear_valueChange : String? = nil
        
        MyInfo.shared.id = clear_id
 //       MyInfo.shared.password = clear_password
        MyInfo.shared.date = clear_dateLabel
        MyInfo.shared.phoneNumber = clear_phoneNumber
        MyInfo.shared.pickerDate = Date()
        MyInfo.shared.valueChange = clear_valueChange
    }
    
//

}

