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
  //  var model : ContactsModel = ContactsModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 특정 section에 해당하는 섹션 제목 String return
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if section % 2 == 1 {
//            return nil
//        }
//        else {
//            return "Section \(section)"
        
//        }
        //      return "Section \(section)"
//    }
    
    // 테이블 뷰의 섹션 수를 return
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    //특정 section에 해당하는 row의 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }
    
    // 특정 IndexPath(section, row)에 해당하는 cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defualtCellIdentifier, for : indexPath)
        //        cell.textLabel?.text = "\(indexPath.section) section"
        cell.textLabel?.text = "\(indexPath.section).\(indexPath.row)"
        
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.white
        }
        //        cell.detailTextLabel?.text = "\(indexPath.row) Row"
        //
        //        let friend : Person = model.friends[indexPath.row]
        //        cell.textLabel?.text = friend.name
        //        cell.detailTextLabel?.text = friend.mobile
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section % 2 == 0 {
            return 50
        } else{
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section) Section의 \(indexPath.row)를 Row를 사용자가 선택함")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at : indexPath)
        
        if indexPath.row % 2 == 0 {
            self.performSegue(withIdentifier: "ShowYellow", sender: cell)
        } else {
            self.performSegue(withIdentifier: "ShowIvory", sender: cell)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell else {
            print("sender가 cell이 아님")
            return
        }
        guard let nextViewController = segue.destination as? IvoryViewController else {
            print("목적지가 pink 아님")
            return
        }
        
        nextViewController.text = cell.textLabel?.text
    }
}

