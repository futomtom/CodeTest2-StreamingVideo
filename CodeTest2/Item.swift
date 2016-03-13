//
//  Item.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON




struct Item
{
    var name:String?
    var videoStillURL:String?
    var shortDescription:String?
    var audioOnly:Bool?
    var tags:[String]=[]
    var videoLink:String?
    var HighvideoLink:String?
    
    
        init( itemData:JSON )
    {
        name=itemData["name"].string
        videoStillURL=itemData["videoStillURL"].string
        shortDescription=itemData["shortDescription"].string
        audioOnly=itemData["audioOnly"].bool
        
        for (_, object) in itemData["tags"]
        {
            if let tag=object.string
            {
                    tags.append(tag)
            }
        }
        
        videoLink=itemData["IOSRenditions"][0]["url"].string
        HighvideoLink=itemData["IOSRenditions"][1]["url"].string
    }
}
