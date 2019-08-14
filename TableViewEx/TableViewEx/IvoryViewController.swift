//
//  IvoryViewController.swift
//  TableViewEx
//
//  Created by 임태완 on 2019. 8. 13..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class IvoryViewController: UIViewController {

    var text : String?
    @IBOutlet var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = text

        
        
        // Do any additional setup after loading the view.
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
