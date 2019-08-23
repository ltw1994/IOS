//
//  SecondViewController.swift
//  KUFileIOBasic
//
//  Created by cscoi018 on 2019. 8. 16..
//  Copyright © 2019년 seok. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contacts: [ContactInfo] = []
    
    @IBOutlet var tableView: UITableView!
    let defaultCellIdentifier = "cell"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "contacts.json") else {
            print("데이터 에셋 로드 실패")
            return
        }
        
        let jsonData: Data = dataAsset.data
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            contacts = try decoder.decode([ContactInfo].self, from: jsonData)
        } catch {
            print("json decode failed " + error.localizedDescription)
            return
        }
        
        print("파일에서 불러온 친구 수 : \(contacts.count)")
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactsTableViewCell
        
        let contact: ContactInfo = contacts[indexPath.row]
        cell.nameLabel.text = contact.name
        cell.mobileLabel.text = contact.mobile
        
        let dateFormatter: DateFormatter = {
            let formatter: DateFormatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
        
        let createdDate: Date = contact.created!        
        cell.createdLabel.text = dateFormatter.string(from: createdDate)
        
        return cell
    }
    
    func loadContactsFromFile() {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("contacts.json")
        let jsonData: Data
        
        do {
            jsonData = try Data(contentsOf: filePath)
        } catch {
            print("load data 실패 " + error.localizedDescription)
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            contacts = try decoder.decode([ContactInfo].self, from: jsonData)
            print("파일에서 불러온 친구 수 : \(contacts.count)")
        } catch {
            print("decode json 실패 " + error.localizedDescription)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadContactsFromFile()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
