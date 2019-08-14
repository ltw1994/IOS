//
//  RegisterViewController.swift
//  SignUp
//
//  Created by 임태완 on 2019. 8. 7..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var datePicker : UIDatePicker!
    @IBOutlet weak var phoneNumberLabel : UITextField!
    @IBOutlet var registerButton : UIButton!
    
    let dateFormatter : DateFormatter = {
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        //formatter.dateStyle = .long
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender : UIDatePicker) {
        
        let date : Date = self.datePicker.date
        let dateString : String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateString
        MyInfo.shared.valueChange = "true"

        determineButtonState()
        
    }
    
    @IBAction func textFieldTextEdited(_ sender : UITextField) {
        determineButtonState()
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        determineButtonState()
        return true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
        if MyInfo.shared.pickerDate != nil {
            let today : Date = MyInfo.shared.pickerDate!
            let todayString : String = self.dateFormatter.string(from: today)
            self.dateLabel.text = todayString
            datePicker.date = today
            
        } else {
            let today : Date = Date()
            let todayString : String = self.dateFormatter.string(from: today)
            self.dateLabel.text = todayString
        }
        
        if MyInfo.shared.phoneNumber != nil {
            phoneNumberLabel.text = MyInfo.shared.phoneNumber!
        }
        determineButtonState()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        // Do any additional setup after loading the view.
   //     self.datePicker.maximumDate = Date()
    }
    
    @IBAction func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func clear() {
        let clear_id : String? = nil
        let clear_password : String? = nil
        let clear_phoneNumber : String? = nil
        let clear_dateLabel : String? = nil
        let clear_valueChange : String? = nil

        MyInfo.shared.id = clear_id
        MyInfo.shared.password = clear_password
        MyInfo.shared.date = clear_dateLabel
        MyInfo.shared.phoneNumber = clear_phoneNumber
        MyInfo.shared.pickerDate = Date()
        MyInfo.shared.valueChange = clear_valueChange
    }
    
    @IBAction func back() {
        
        MyInfo.shared.phoneNumber = phoneNumberLabel.text
        MyInfo.shared.date = dateLabel.text
        MyInfo.shared.pickerDate = datePicker.date
    }
    @IBAction func dismissSelf() {
        self.dismiss(animated : true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    
    func determineButtonState() {
        
        if let isPhone : String = phoneNumberLabel.text, isPhone.count > 0,
            let isChange : String = MyInfo.shared.valueChange,  isChange == "true"
        {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }

    }
}
