//
//  ViewController.swift
//  Trainsition
//
//  Created by 임태완 on 2019. 8. 5..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func dismissself() {
        self.dismiss(animated: true, completion : nil)
    }

}

