//
//  HeaderViewCell.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit

class HeaderViewCell: UICollectionViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerIcon: UIImageView!
    @IBOutlet weak var headerImage: UIImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
    }
}
