//
//  ListViewCell.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit
import Kingfisher

class ListViewCell: UITableViewCell {
    
    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var shortDescription: UILabel!
    @IBOutlet weak var tagText: UILabel!
    @IBOutlet weak var playIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    func renderData(item: Item) {
        BackGroundView.roundCorner(5)
        thumbImageView.kf_setImageWithURL(NSURL(string:item.videoStillURL!)!)
        thumbImageView.roundCorner(5)
        shortDescription.text = item.shortDescription
        tagText.text=item.tags.filter{$0 != "empty"}.joinWithSeparator(", ")
    }
}
