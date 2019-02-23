//
//  AlbumPreviewSectionController.swift
//  Searchify
//
//  Created by C McGhee on 9/7/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//  Preview Page Control

import UIKit
import IGListKit

class AlbumPreviewSectionController: ListSectionController {

    fileprivate let albumsArray = ["nexttankbangas", "samtrump", "sza", "childishgambino", "add-2", "pjmortonblackwhite"] //albums data, pull from internet eventually
    
    var pageControl = UIPageControl()
    let screenSize = UIScreen.main.bounds
    
    //MARK: Sizing Cell
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: screenSize.width, height: 160)
    }
    //MARK: Adding Photos to Cell
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "AlbumPreviewCollectionViewCell", bundle: nil, for: self, at: index) as? AlbumPreviewCollectionViewCell
            else{fatalError()}
        
        
        // MARK: - Page Control
        cell.albumPageControl.numberOfPages = albumsArray.count/2
        pageControl = cell.albumPageControl
        
        cell.albumScrollView.delegate = self
        cell.albumScrollView.isPagingEnabled = true
        
        let height = cell.albumScrollView.frame.height
        
        cell.albumScrollView.contentSize = CGSize(width: screenSize.width, height: height)
        
        // MARK: - Bounce Properties (none)
        cell.albumScrollView.showsHorizontalScrollIndicator = false
        cell.albumScrollView.showsVerticalScrollIndicator = false
        cell.albumScrollView.bounces = false
        
        for i in 0..<albumsArray.count{
            let imageView = UIImageView()
            imageView.image = UIImage(imageLiteralResourceName: albumsArray[i])
            imageView.contentMode = .scaleAspectFit
            
            cell.albumScrollView.addSubview(imageView)
            
            imageView.frame.size.width = cell.albumScrollView.frame.width/2
            
            let x = imageView.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: cell.albumScrollView.frame.width/2, height: height)
            
            cell.albumScrollView.contentSize.width = cell.albumScrollView.contentSize.width/2 * CGFloat(i + 1)
        }
        return cell
    }
    
}

extension AlbumPreviewSectionController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        let page = scrollView.contentOffset.x/(scrollView.frame.size.width/CGFloat(albumsArray.count))
        pageControl.currentPage = Int(page)
    }
}



