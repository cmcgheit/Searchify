//
//  SearchViewController.swift
//  Searchify
//
//  Created by C McGhee on 9/30/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation
import ChameleonFramework
// import CloudrailSI

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var posts = [Post]()
    
    var searchURL = String()
    
    // var service: VideoProtocol?
    // var vimeo: Vimeo?
    // var youtube: YouTube?

    typealias JSONStandard = [String: AnyObject]

    // MARK: - CloudRail Properties
//    func searchVideos() { ((query: String, offset: CLong, limit: CLong)
//        throws -> NSMutableArray).self
//        
//        do {
//            try service?.searchVideosWithQuery("CloudRail", offset: 50, limit: 20)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//    func searchVimeo() {
//        service = vimeo
//    }
//    
//    func searchYoutube() {
//        service = youtube
//        youtube?.useAdvancedAuthentication()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Searchify"
        //MARK: - Chameleon Settings/Navigation Bar Properties
        self.navigationController?.hidesNavigationBarHairline = true
        view.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.cyan
        self.setStatusBarStyle(UIStatusBarStyleContrast)
        
        // Navigation Bar Customization
        // Clear bar, can set image to any image or leave blank for no bar/image
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let textAttributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor):UIColor.cyan]
        navigationController?.navigationBar.titleTextAttributes = convertToOptionalNSAttributedStringKeyDictionary(textAttributes)
        // Search Bar Properties
        searchBar.barTintColor = UIColor.black
        searchBar.tintColor = UIColor.cyan
        
        //        Leave this if you want to call certain search when app loads
        //        callAlamo(url: searchURL)
        
        // MARK: CloudRail/Universal Search Properties
//        vimeo = Vimeo.init(clientId: vimeoClientID,
//                           clientSecret: vimeoClientSecret)
        
        
//        youtube = YouTube.init(clientId: youTubeClientID,
//                               clientSecret: "",  // will be blank
//            redirectUri: youTubeRedirectURI,
//            state: "AWESOME_STATE")

    }
    
    // MARK: - Alamo Call for Spotify Search
    func callAlamo (url: String) {
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            
        })
    }
    
    func parseData(JSONData: Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            if let tracks = readableJSON["tracks"] as? JSONStandard{
                if let items = tracks["items"] as? [JSONStandard] {
                    for i in 0..<items.count{
                        let item = items[i]
                        print(item)
                        
                        let name  = item["name"] as! String
                        let previewURL = item["preview_url"] as! String
                        if let album = item["album"] as? JSONStandard {
                            if let images = album["images"] as? [JSONStandard] {
                                let imageData = images[0]
                                let mainImageURL = URL(string: imageData["url"] as! String)
                                let mainImageData = NSData(contentsOf: mainImageURL!)
                                
                                let mainImage = UIImage(data: mainImageData! as Data)
                                
                                posts.append(Post.init(mainImage: mainImage, name: name, previewURL: previewURL))
                                self.searchTableView.reloadData()
                            }
                        }
                        
                    }
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.searchTableView.indexPathForSelectedRow?.row
        
        let vc = segue.destination as! MusicPlayerViewController
        
        vc.image = posts[indexPath!].mainImage
        vc.mainSongTitle = posts[indexPath!].name
        vc.mainPreviewURL = posts[indexPath!].previewURL
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let mainImageView = cell?.viewWithTag(2) as! UIImageView
        
        mainImageView.image = posts[indexPath.row].mainImage
        
        let mainLabel = cell?.viewWithTag(1) as! UILabel
        
        mainLabel.text = posts[indexPath.row].name
        
        return cell!
        
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keywords = searchBar.text
        let finalKeywords = keywords?.replacingOccurrences(of: " ", with: "+")
        
        searchURL = "https://api.spotify.com/v1/search?q=\(finalKeywords!)&type=track,artist"
        
        callAlamo(url: searchURL)
        // searchVimeo()
        // searchYoutube()
        self.view.endEditing(true)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
