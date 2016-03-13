//
//  WebService.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher



class WebService {
    
    
    // Add URL parameters
     static var urlParams = [
        "command":"",
        "page_size":"25",    "video_fields":"id,name,shortDescription,creationDate,publishedDate,linkURL,linkText,tags,videoStillURL,thumbnailURL,length,renditions,iOSRenditions,HDSRenditions",
        "media_delivery":"default",
        "sort_by":"PUBLISH_DATE:DESC",
        "page_number":"0",
        "get_item_count":"true",
        "token":"09MQKMo8MdLanB7dqUAJWoeMXY2FDrbYhfnEpx91paZbR7-GxK2nBQ..",
    ]
    
    static let url="http://api.brightcove.com/services/library"
    
  
    static func Retrive(completion: (success: Bool, result: [Item]?) -> Void)
    {
        var items : [Item] = []
        urlParams["command"]="search_videos"
        
        Alamofire.request(.GET,url, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseJSON { response in

                if let result = response.result.value {
                    let json=JSON(result)
                     for (_, object) in json["items"]
                    {
                        let item=Item(itemData: object)
                        items.append(item)
                    }

                completion(success: true, result: items)
                }
                else{
                completion(success: false, result: nil)
                }
        }
    }
}