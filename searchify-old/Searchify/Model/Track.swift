//
//  Track.swift
//  Searchify
//
//  Created by C McGhee on 9/30/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import Foundation
import IGListKit

class Track{
    
    func getData()->[ListDiffable]{
        
        let data = [AlbumView(albumID: 11, albumImage: #imageLiteral(resourceName: "albums")),
                    HeaderData(icon: #imageLiteral(resourceName: "tracks"), heading: "TRACKS"),
                    TracksData(trackID: "T1", trackIcon: #imageLiteral(resourceName: "solange-seatattable"), trackName: "Don't Touch My Hair", trackDetail: "Solange", trackTime: 4.17),
                    TracksData(trackID: "T2", trackIcon: #imageLiteral(resourceName: "ericroberson-wind"), trackName: "Million Dollars", trackDetail: "Eric Roberson", trackTime: 4.03),
                    TracksData(trackID: "T3", trackIcon: #imageLiteral(resourceName: "kendricklamar-damn"), trackName: "Loyalty", trackDetail: "Kendrick Lamar", trackTime: 4.09),
                    TracksData(trackID: "T4", trackIcon: #imageLiteral(resourceName: "pjmorton-gumbo"), trackName: "Claustrophobic", trackDetail: "PJ Morton", trackTime: 3.30),
                    TracksData(trackID: "T5", trackIcon: #imageLiteral(resourceName: "solange-seatattable"), trackName: "F.U.B.U", trackDetail: "Solange", trackTime: 4.00),
                    1,
                    HeaderData(icon: #imageLiteral(resourceName: "albums"), heading: "ALBUMS"),
                    "Tracks",
                    2
            ] as [Any]
        return data as! [ListDiffable]
    }
}

