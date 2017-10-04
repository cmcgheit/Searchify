//
//  AlbumView.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//  AlbumView

import Foundation
import IGListKit

class AlbumView: NSObject{
    
    let albumID: Int!
    let albumImage: UIImage
    
    init(albumID: Int, albumImage: UIImage){
        self.albumID = albumID
        self.albumImage = albumImage
    }
}
extension AlbumView: ListDiffable{
    func diffIdentifier() -> NSObjectProtocol{
        return albumID as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool{
        guard self !== object else { return true }
        guard let object = object as? AlbumView else { return false }
        return albumID == object.albumID
    }
    
}
