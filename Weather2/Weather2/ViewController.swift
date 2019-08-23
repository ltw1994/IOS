//
//  ViewController.swift
//  FriendsTable
//
//  Created by 임태완 on 2019. 8. 14..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var countries : [Flag] = []
    
    @IBOutlet var tableView : UITableView!
    
    let defualtCellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = UIColor.blue
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //navigationController?.navigationBar.barTintColor = UIColor.blue
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.foregroun
        
        guard let dataAsset : NSDataAsset = NSDataAsset(name : "countries") else {
            print("데이터 에셋 로드 실패")
            return
        }
        
        let jsonData : Data = dataAsset.data
        let decoder : JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        
        do {
            countries = try decoder.decode([Flag].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        
        print("나라 \(countries.count)명 로드됨")
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //특정 section에 해당하는 row의 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }
    
    // 특정 IndexPath(section, row)에 해당하는 cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        
        let country : Flag = countries[indexPath.row]
        cell.textLabel?.text = country.koreanName
        if let assetName : String = country.assetName,
            let image : UIImage = UIImage(named : "flag_"+assetName){
            cell.imageView?.image = image
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //
    //        return UITableViewCell.EditingStyle.delete
    //    }
    //
    //    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    //
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == UITableViewCell.EditingStyle.delete {
    //
    //            friends.remove(at: indexPath.row)
    //            //tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    //            tableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
    //
    //        }
    //    }
    
}

