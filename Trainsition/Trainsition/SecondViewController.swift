//
//  SecondViewController.swift
//  Trainsition
//
//  Created by 임태완 on 2019. 8. 5..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var label : UILabel!

    // 메모리가
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.gray
        print("view did load")
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.label?.alpha  = 0 // 투명도
        
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.label?.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.label?.alpha = 1
        }
        print("view did appear")
    }
    
    
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
