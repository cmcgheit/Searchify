//
//  Made with ❤ and ☕ 
//

import UIKit
import SafariServices

class SearchViewVC: UIViewController {
    
    private var categories = [Category]()
    
    let searchController: UISearchController = {
        let searchVC = UISearchController(searchResultsController: SearchResultsVC())
        searchVC.searchBar.placeholder = "Songs, Artists, Albums"
        searchVC.searchBar.searchBarStyle = .minimal
        searchVC.definesPresentationContext = true
        return searchVC
    }()
    
    private let searchCollectionView: UICollectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection? in
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))

                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 7, bottom: 2, trailing: 7)

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitem: item, count: 2)

                group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

                return NSCollectionLayoutSection(group: group)
            }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        
        view.addSubview(searchCollectionView)
        searchCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.backgroundColor = .systemBackground
        
        getCategories()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchCollectionView.frame = view.bounds
    }
    
    private func getCategories() {
        APIManager.shared.getCategories { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let categories):
                    self?.categories = categories
                    self?.searchCollectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Search Function (only happens when user hits enter/return to save API hits)
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let resultsController = searchController.searchResultsController as? SearchResultsVC, let query = searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        resultsController.delegate = self
        
        APIManager.shared.search(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    resultsController.update(with: results)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

// MARK: - Search Controller Delegate/Functions
extension SearchViewVC: UISearchResultsUpdating, UISearchBarDelegate, SearchResultsVCDelegate {
    func didTapResult(_ result: SearchResult) {
        switch result {
        case .artist(let model):
            guard let url = URL(string: model.external_urls["spotify"] ?? "") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            
        case .album(let model):
            let albumVC = AlbumVC(album: model)
            albumVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(albumVC, animated: true)
        case .track(let model):
            PlayCoordinator.shared.startPlayback(from: self, track: model)
        case .playlist(let model):
            let playlistVC = PlaylistVC(playlist: model)
            playlistVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(playlistVC, animated: true)
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

// MARK: - Search Collection Delegate/Functions
extension SearchViewVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        let category = categories[indexPath.row]
        searchCell.configure(with: CategoryViewModel(title: category.name, artworkURL: URL(string: category.icons.first?.url ?? "")))
        return searchCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let category = categories[indexPath.row]
        let categoryVC = CategoryVC(category: category)
        categoryVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(categoryVC, animated: true)
    }
}
