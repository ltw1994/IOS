//
//  SecondViewController.swift
//  SingletonSample
//
//  Created by 임태완 on 2019. 8. 8..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var nameField : UITextField!
    @IBOutlet var ageField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = MyInfo.shared.name
        ageField.text = MyInfo.shared.age
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        MyInfo.shared.name = nameField.text
        MyInfo.shared.age = ageField.text
    }
    
    @IBAction func textFieldTextEdited(_ sender : UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
