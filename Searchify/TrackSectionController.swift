//
//  TrackSectionController.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit
import IGListKit

class TrackSectionController: ListSectionController {
    
    fileprivate var trackItem: TracksData!
    
    override init(){
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
    }
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 60)
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "TrackViewCell", bundle: nil, for: self, at: index) as? TrackViewCell else { fatalError() }
        
        cell.trackDetail.text = trackItem.trackDetail
        cell.trackIcon.image = trackItem.trackIcon
        cell.trackTitle.text = trackItem.trackName
        
        return cell
    }
    override func didUpdate(to object: Any) {
        trackItem = object as? TracksData
    }


}
