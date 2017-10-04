//
//  MusicPlayerViewController.swift
//  Searchify
//
//  Created by C McGhee on 5/3/17
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation
import ChameleonFramework

var player = AVAudioPlayer()

class MusicPlayerViewController: UIViewController {
    
    var image = UIImage()
    var mainSongTitle = String()
    var mainPreviewURL = String()
    
    @IBOutlet var background: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var playpausebtn: UIButton!
    
    override func viewDidLoad() {
        self.navigationItem.title = "Searchify - Song Preview"
        self.navigationController?.hidesNavigationBarHairline = true
        
        songTitle.text = mainSongTitle
        background.image = image
        mainImageView.image = image
        
        downloadFileFromURL(url: URL(string: mainPreviewURL)!)
        
        playpausebtn.setTitle("Pause Preview", for: .normal)
        
    }
    
    func downloadFileFromURL(url: URL) {
        var downloadTask = URLSessionDownloadTask()
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {
            customURL, response, error in
            
            self.play(url: customURL!)
            
        })
        
        downloadTask.resume()
        
    }
    
    func play(url: URL) {
        
        do {
            
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        }
        catch{
            print(error)
        }
    }
    
    
    @IBAction func pauseplay(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playpausebtn.setTitle("Crank It", for: .normal)
            
        }
        else{
            player.play()
            playpausebtn.setTitle("Shut It Off", for: .normal)
        }
    }
    
}
