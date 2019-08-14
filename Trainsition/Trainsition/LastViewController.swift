//
//  LastViewController.swift
//  Trainsition
//
//  Created by 임태완 on 2019. 8. 5..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    // goBack, goRoot
    @IBAction func dismissSelf() {
        self.dismiss(animated : true, completion: nil)
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
