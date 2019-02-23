//
//  AlbumPreviewsData.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
// AlbumPreviews

import Foundation
import IGListKit

class AlbumPreviewsData: ListDiffable {
   
    let albumID: Int
    let albumImage: String
    
    init(albumID: Int, albumImage: String){
        self.albumID = albumID
        self.albumImage = albumImage
    }
    func diffIdentifier() -> NSObjectProtocol{
        return albumID as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool{
        guard self !== object else { return true }
        guard let object = object as? AlbumPreviewsData else { return false }
        return albumID == object.albumID
    }


}
