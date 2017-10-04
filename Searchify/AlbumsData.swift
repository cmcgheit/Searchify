//
//  AlbumsData.swift
//  Searchify
//
//  Created by C McGhee on 9/29/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//  Album

import Foundation
import IGListKit

final class AlbumsData: NSObject{
    
    let albumID: Int!
    var albumImage: UIImage
    var title: String
    var artist: String
    
    init(albumID: Int, albumImage: UIImage, title: String, artist: String){
        self.albumID = albumID
        self.albumImage = albumImage
        self.title = title
        self.artist = artist
    }
    
}
extension AlbumsData: ListDiffable{
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self === object ? true : self.isEqual(object)
    }


}


