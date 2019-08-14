//
//  ViewController.swift
//  SingletonSample
//
//  Created by 임태완 on 2019. 8. 8..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var ageField : UITextField!
    @IBOutlet var nextButton : UIButton!

    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        determineButtonState()
        
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        return true
    }
   */
    
    @IBAction func textFieldTextEdited(_ sender : UITextField) {
        determineButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameField.delegate = self
        ageField.delegate = self
    
    }

    func determineButtonState() {
  
        if let name : String = nameField.text, name.count > 0, let age : String = ageField.text, age.count > 0 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
        nameField.text = MyInfo.shared.name
        ageField.text = MyInfo.shared.age
        
        super.viewWillAppear(animated)
        //determineButtonState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        MyInfo.shared.name = nameField.text
        MyInfo.shared.age = ageField.text
        
    }

}

