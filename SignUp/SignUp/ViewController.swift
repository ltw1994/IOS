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
        
        self.idLabel.text = MyInfo.shared.id
        self.passwordLabel.text = MyInfo.shared.password
    //    self.passwordConfirmLabel.text = MyInfo.shared.passwordConfirm
        
    }


}

