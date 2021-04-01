//
//  HeaderData.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import Foundation
import IGListKit

class HeaderData: ListDiffable {
    
    let icon: UIImage
    let heading: String!
    
    init(icon: UIImage, heading: String){
        self.icon = icon
        self.heading = heading
    }
    func diffIdentifier() -> NSObjectProtocol {
        return heading as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? HeaderData else { return false }
        return heading == object.heading
    }


}
