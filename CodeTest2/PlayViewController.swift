//
//  PlayViewController.swift
//  CodeTest2
//
//  Created by alexfu on 3/13/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit
import MobilePlayer
import SnapKit

class PlayViewController: UIViewController {

    var playItem:Item=Item(itemData: nil)
    var virwRect:CGRect=CGRect()
   
    @IBOutlet weak var PlayerView: UIView!
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = NSBundle.mainBundle()
        let config = MobilePlayerConfig(fileURL: bundle.URLForResource(
            "MovielalaPlayer",
            withExtension: "json")!)
        
        let playerVC = MobilePlayerViewController(contentURL:NSURL(string: playItem.videoLink!)!,config: config )
        playerVC.title = playItem.name
        addChildViewController(playerVC)
        playerVC.view.frame = PlayerView.frame
        playerVC.didMoveToParentViewController(self)
        PlayerView.addSubview(playerVC.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            self.navigationController!.navigationBar.hidden = true
            UIApplication.sharedApplication().statusBarHidden = true
            
            PlayerView.removeConstraints(PlayerView.constraints)
            
            PlayerView.snp_makeConstraints { (make) -> Void in
                make.edges.equalTo(self.view)
            }
            TableView.hidden=true
            self.view.layoutIfNeeded()
            
            
        } else {
            self.navigationController!.navigationBar.hidden = false
            UIApplication.sharedApplication().statusBarHidden = false
            PlayerView.removeConstraints(PlayerView.constraints)
            
            PlayerView.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(self.view).offset(64)
                make.width.equalTo(self.view)
                make.height.equalTo(self.view).multipliedBy(0.4)
            }
            TableView.hidden=false
            self.view.layoutIfNeeded()
        }
    }
    

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
