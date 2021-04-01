//
//  ViewController.swift
//  Searchify
//
//  Created by C McGhee on 5/3/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController, ListAdapterDataSource {
    
    @IBOutlet var searchCollectionView: UICollectionView!
    
    let tracksData = Track()
    
    var data: [Any] = []
    
    var viewIsDark = Bool()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = tracksData.getData()
        setupHeader()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adapter.collectionView = searchCollectionView
        adapter.dataSource = self
    }
    
    // MARK: - Section Header
    func setupHeader(){
        let bounds = navigationController?.navigationBar.bounds
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: (bounds?.width)!, height: (bounds?.height)!))
        
        headerLabel.text = "What's New"
        headerLabel.textColor = .white
        headerLabel.font = headerLabel.font.withSize(20)
        navigationItem.titleView = headerLabel
        
    }
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable]{
        return data as! [ListDiffable]
    }
    
    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController{
        switch object{
        case is HeaderData:
            return HeaderSectionController()
        case is TracksData:
            return TrackSectionController()
        case is AlbumView:
            return AlbumPreviewSectionController()
        case is String:
            return AlbumSectionController()
        default:
            return ButtonSectionController()
        }
        
    }
    
    // MARK: - Status Bar
    public func emptyView(for listAdapter: ListAdapter) -> UIView?{
        return nil
    }
    
    func makeViewDark() {
        viewIsDark = true
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func makeViewLight() {
        viewIsDark = false
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        if viewIsDark {
            return .lightContent
        } else {
            return .default
        }
    }
}
