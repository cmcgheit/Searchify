//
//  HeaderSectionController.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit
import IGListKit

class HeaderSectionController: ListSectionController {
    
    fileprivate var headerItem: HeaderData!
    
    override init(){
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
    }
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 45)
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "HeaderViewCell", bundle: nil, for: self, at: index) as? HeaderViewCell else { fatalError() }
        
        cell.headerIcon.image = headerItem.icon
        cell.headerLabel.text = headerItem.heading
        
        return cell
    }
    override func didUpdate(to object: Any) {
        headerItem = object as? HeaderData
    }


}
