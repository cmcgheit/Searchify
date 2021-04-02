//
//  Made with ❤ and ☕ 
//

import UIKit

class LibraryVC: UIViewController {
    
    private let libraryPlaylistsVC = LibraryPlaylistsVC()
    private let libraryAlbumsVC = LibraryAlbumsVC()
    
    private let libraryToggleView = LibraryToggleView()
    
    private let libraryScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Library"
        view.backgroundColor = .systemBackground
        
        view.addSubview(libraryScrollView)
        libraryScrollView.delegate = self
        libraryScrollView.contentSize = CGSize(width: view.width * 2, height: libraryScrollView.height)
        addScrollViewChildren()
        
        view.addSubview(libraryToggleView)
        libraryToggleView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        libraryScrollView.frame = CGRect(x: 0, y: view.safeAreaInsets.top + 55, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 55)
        libraryToggleView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 200, height: 55)
    }
    
    private func addScrollViewChildren() {
        addChild(libraryPlaylistsVC)
        libraryScrollView.addSubview(libraryPlaylistsVC.view)
        libraryPlaylistsVC.view.frame = CGRect(x: 0, y: 0, width: libraryScrollView.width, height: libraryScrollView.height)
        libraryPlaylistsVC.didMove(toParent: self)
        
        addChild(libraryAlbumsVC)
        libraryScrollView.addSubview(libraryAlbumsVC.view)
        libraryAlbumsVC.view.frame = CGRect(x: view.width, y: 0, width: libraryScrollView.width, height: libraryScrollView.height)
        libraryAlbumsVC.didMove(toParent: self)
    }
}

extension LibraryVC: UIScrollViewDelegate {
    func scrollviewDidScroll(_ scrollView: UIScrollView) {
        // Moves indicator
        if scrollView.contentOffset.x >= (view.width - 100) {
            libraryToggleView.update(for: .album)
        } else {
            libraryToggleView.update(for: .playlist)
        }
    }
}

extension LibraryVC: LibraryToggleViewDelegate {
    func libraryToggleViewDidTapPlaylists(_ toggleView: LibraryToggleView) {
        libraryScrollView.setContentOffset(.zero, animated: true)
    }
    
    func libraryToggleViewDidTapAlbums(_ toggleView: LibraryToggleView) {
        libraryScrollView.setContentOffset(CGPoint(x: view.width, y: 0), animated: true)
    }
}
