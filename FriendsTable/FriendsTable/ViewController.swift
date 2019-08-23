//
//  ViewController.swift
//  FriendsTable
//
//  Created by 임태완 on 2019. 8. 14..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var friends : [Friend] = []
    @IBOutlet var tableView : UITableView!
    let defualtCellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset : NSDataAsset = NSDataAsset(name : "friends") else {
            print("데이터 에셋 로드 실패")
            return
        }
        
        let jsonData : Data = dataAsset.data
        let decoder : JSONDecoder = JSONDecoder()
        
        do {
            friends = try decoder.decode([Friend].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        
        print("친구 \(friends.count)명 로드됨")
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //특정 section에 해당하는 row의 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }
    
    // 특정 IndexPath(section, row)에 해당하는 cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defualtCellIdentifier, for : indexPath) as! FriendTableViewCell
        //        cell.textLabel?.text = "\(indexPath.section) section"
        
        let friend : Friend = friends[indexPath.row]
        cell.nameLabel.text = friend.name
        cell.mobileLabel.text = friend.mobile
        
        if let age = friend.age {
            cell.ageLabel.text = "\(age)"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return UITableViewCell.EditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            friends.remove(at: indexPath.row)
            //tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            tableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
            
        }
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section % 2 == 0 {
//            return 50
//        } else{
//            return 150
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.section) Section의 \(indexPath.row)를 Row를 사용자가 선택함")
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let cell = tableView.cellForRow(at : indexPath)
//
//        if indexPath.row % 2 == 0 {
//            self.performSegue(withIdentifier: "ShowYellow", sender: cell)
//        } else {
//            self.performSegue(withIdentifier: "ShowIvory", sender: cell)
//        }
//
//    }
}

