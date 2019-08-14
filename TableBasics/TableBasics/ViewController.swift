//
//  ViewController.swift
//  TableBasics
//
//  Created by 임태완 on 2019. 8. 12..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView : UITableView!
    let defualtCellIdentifier = "cell"
    var model : ContactsModel = ContactsModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 특정 section에 해당하는 섹션 제목 String return
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section % 2 == 1 {
            return nil
        }
        else {
            return "Section \(section)"
        }
  //      return "Section \(section)"
    }
    
    // 테이블 뷰의 섹션 수를 return
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //특정 section에 해당하는 row의 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    if section % 2 == 0 {
//        return 3
//    } else {
//        return 7
        return model.friends.count
    }
    
    // 특정 IndexPath(section, row)에 해당하는 cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defualtCellIdentifier, for : indexPath)
//        cell.textLabel?.text = "\(indexPath.section) section"
//        cell.detailTextLabel?.text = "\(indexPath.row) Row"
        
        let friend : Person = model.friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.mobile
        
        return cell
    }
}

