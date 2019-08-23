//
//  ViewController.swift
//  FriendsTable
//
//  Created by 임태완 on 2019. 8. 14..
//  Copyright © 2019년 임태완. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weathers : [WeatherInfo] = []
    
    var textToSet : String?
    var assetName : String?
    
    @IBOutlet var tableView : UITableView!
    
    let defualtCellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UINavigationBar.appearance().barTintColor = UIColor.blue
        self.navigationItem.title = self.textToSet
        
        tableView.delegate = self
        tableView.dataSource = self

        guard let dataAsset : NSDataAsset = NSDataAsset(name : assetName!) else {
            print("데이터 에셋 로드 실패")
            return
        }
        
        let jsonData : Data = dataAsset.data
        let decoder : JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        
        do {
            weathers = try decoder.decode([WeatherInfo].self, from: jsonData)
        } catch {
            print("json decode failed" + error.localizedDescription)
        }
        
        print("나라 \(weathers.count)명 로드됨")
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //특정 section에 해당하는 row의 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weathers.count
    }
    
    // 특정 IndexPath(section, row)에 해당하는 cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customcell : WeatherTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "customcell", for : indexPath) as! WeatherTableViewCell
        
        let weather : WeatherInfo = weathers[indexPath.row]
        customcell.cityLabel?.text = weather.cityName
        customcell.tempLabel?.text = String(weather.celsius!)
        customcell.rainyLabel?.text = String(weather.rainfallProbability!)
        

//        if let assetName : String = weather.assetName,
//            let image : UIImage = UIImage(named : "flag_"+assetName){
//            cell.imageView?.image = image
//        }
        
        
        return customcell
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
