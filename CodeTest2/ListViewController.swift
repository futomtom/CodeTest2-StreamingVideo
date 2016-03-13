//
//  ListViewController.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var items:[Item]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        WebService.Retrive { (success, result) -> Void in
            if(success){
                print("getdata")
                self.items=result!
                self.tableView.reloadData()
            }
            else
            {
                 print("get data fail")
            }
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("listcell", forIndexPath: indexPath) as! ListViewCell
            cell.renderData(items[indexPath.row])
            return cell
        }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let playVC=storyboard?.instantiateViewControllerWithIdentifier("PlayViewController") as! PlayViewController
        playVC.playItem=items[indexPath.row]
        
        showViewController(playVC, sender: self)
    }
    
        
    
  


}
