//
//  TrackViewCell.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit

class TrackViewCell: UICollectionViewCell {

    @IBOutlet weak var trackIcon: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackDetail: UILabel!
    @IBOutlet weak var trackTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
    }
}
