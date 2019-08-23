//
//  ViewController.swift
//  ImagePicker
//
//  Created by 임태완 on 2019. 8. 6..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var idField : UITextField!
    @IBOutlet weak var passwordField : UITextField!
    @IBOutlet weak var passwordConfirmField : UITextField!
    @IBOutlet var nextButton : UIButton!
    @IBOutlet var myFieldView : UITextView!
    var isImageSelected: Bool = false
    
    
    
    lazy var imagePicker : UIImagePickerController = {
        let picker : UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        imageView.isUserInteractionEnabled = true

        return picker
    }()
    
    @IBOutlet weak var imageView : UIImageView!
    
    @IBAction func touchUpimageView(_sender : UITapGestureRecognizer){
        self.present(self.imagePicker, animated : true, completion : nil)
        determineButtonState()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFieldView.delegate = self
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.touchUpimageView(_sender:) ))
        self.imageView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
         determineButtonState()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage : UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.imageView.image = originalImage
            self.isImageSelected = true
    
        }
        self.dismiss(animated: true, completion: nil)
         determineButtonState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {


    }
    
    @IBAction func textFieldTextEdited(_ sender : UITextField) {
        determineButtonState()
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        determineButtonState()
        return true
        
    }
    
//    func textViewTextEdited(_ sender : UITextView) {
//        determineButtonState()
//    }

    func textViewDidChange(_ textView: UITextView) {
        determineButtonState()
    }
    func determineButtonState() {
     
        if let id : String = idField.text, id.count > 0,
            let password : String = passwordField.text, password.count > 0,
            let passwordConfirm : String = passwordConfirmField.text, passwordConfirm.count > 0,  password == passwordConfirm,
            let my : String = myFieldView.text, my.count > 0,
            self.isImageSelected
        {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
        
        MyInfo.shared.id = idField.text
        MyInfo.shared.password = passwordField.text
        MyInfo.shared.passwordConfirm = passwordConfirmField.text
    }
    
    @IBAction func clear() {
        let clear_id : String = ""
        let clear_password : String = ""
        let clear_phoneNumber : String = ""
        let clear_dateLabel : String = ""
        MyInfo.shared.id = clear_id
        MyInfo.shared.password = clear_password
        MyInfo.shared.date = clear_dateLabel
        MyInfo.shared.phoneNumber = clear_phoneNumber
    }
    
    @IBAction func dismissSelf() {
        self.dismiss(animated : true, completion: nil)
    }
}

