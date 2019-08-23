//
//  SecondViewController.swift
//  MyBooks
//
//  Created by 임태완 on 2019. 8. 22..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var authorLabel : UILabel!
    @IBOutlet var publisherLabel : UILabel!
    
    //var book : [String:[String:String]]! = Array([:])
    var book : Array<Any> = []
    
    var bookName : String?
    var bookAuthor : String?
    var bookPublisher : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel?.text = bookName
        authorLabel?.text = bookAuthor
        publisherLabel?.text = bookPublisher

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
