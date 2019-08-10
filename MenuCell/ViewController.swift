//
//  ViewController.swift
//  MenuCell
//
//  Created by Anh vũ on 8/10/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
public var childCategoryCell = "childCategoryCell"
public var categoryCell = "categoryCell"

class ViewController: UITableViewController {
    
    var category = ["Male", "female"]
    var chicategory = [
        ["anh vu", "anh thach"],
        ["dung nhi", "quynh dien"]]
    var displaychildcategory: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaychildcategory = chicategory
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return displaychildcategory.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displaychildcategory[section].count + 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: categoryCell, for: indexPath) as! CategoryTableViewCell
            cell.title.text = category[indexPath.section]
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: childCategoryCell, for: indexPath) as! SubCategoryTableViewCell
            cell.title.text = displaychildcategory[indexPath.section][indexPath.row - 1]
            return cell
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {return}
        if displaychildcategory[indexPath.section].isEmpty {
            let indexSet = [Int](1...chicategory[indexPath.section].count).map{
                IndexPath(row: $0, section: indexPath.section)
            }
            displaychildcategory[indexPath.section] = chicategory[indexPath.section]
            tableView.insertRows(at: indexSet, with: .left)
        }else {
            let indexSet = [Int](1...chicategory[indexPath.section].count).map{
                IndexPath(row: $0, section: indexPath.section)
            }
            displaychildcategory[indexPath.section] = []
            tableView.deleteRows(at: indexSet, with: .left)
            
        }
    }
    
}

