//
//  TracksData.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import Foundation
import IGListKit

class TracksData: ListDiffable{
    
    let trackID: String
    let trackIcon: UIImage
    let trackName: String
    let trackDetail: String
    let trackTime: Float
    
    init(trackID: String, trackIcon: UIImage, trackName: String, trackDetail: String, trackTime: Float ){
        self.trackID = trackID
        self.trackIcon = trackIcon
        self.trackName = trackName
        self.trackDetail = trackDetail
        self.trackTime = trackTime
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return trackID as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? TracksData else { return false }
        return trackID == object.trackID
    }

}


