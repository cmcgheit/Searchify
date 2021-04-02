//
//  Made with ❤ and ☕ 
//

import UIKit

enum HomeSectionType {
    case newReleases(viewModels: [NewReleasesViewModel])
    case featuredPlaylists(viewModels: [FeaturedPlaylistViewModel])
    case recommendedTracks(viewModels: [RecommendedTrackViewModel])
    
    var title: String {
        switch self {
        case .newReleases:
            return "Newly Released Albums"
        case .featuredPlaylists:
            return "Featured Playlists"
        case .recommendedTracks:
            return "Recommended Music"
        }
    }
}

class HomeVC: UIViewController {
    
    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
        return HomeVC.createSectionLayout(section: sectionIndex)
    })
    
    private let loadingSpinner: UIActivityIndicatorView = {
        let loadingSpinner = UIActivityIndicatorView()
        loadingSpinner.tintColor = .label
        loadingSpinner.hidesWhenStopped = true
        return loadingSpinner
    }()
    
    private var sections = [HomeSectionType]()
    private var newAlbums: [Album] = []
    private var playlists: [Playlist] = []
    private var tracks: [AudioTrack] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        configureCollectionView()
        view.addSubview(loadingSpinner)
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(NewReleasesCollectionViewCell.self, forCellWithReuseIdentifier: NewReleasesCollectionViewCell.identitifer)
        collectionView.register(RecommendedTrackCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedTrackCollectionViewCell.identifier)
        collectionView.register(FeaturedPlaylistsCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedPlaylistsCollectionViewCell.identifier)
        collectionView.register(
            TitleHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TitleHeaderCollectionReusableView.identifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
    }
    
    // MARK: - Fetch Data
    private func fetchData() {
        let group = DispatchGroup()
        group.enter()
        group.enter()
        group.enter()
        
        var newReleaseResponse: NewReleasesResponse?
        var featuredPlaylistResponse: FeaturedPlaylistsResponse?
        var recommendationsResponse: RecommendationsResponse?
        
        APIManager.shared.getNewReleases { newReleases in
            defer {
                group.leave()
            }
            switch newReleases {
            case .success(let model):
                newReleaseResponse = model
            case . failure(let error):
                print(error.localizedDescription)
            }
        }
        APIManager.shared.getFeaturedPlaylist { featuredPlaylist in
            defer {
                group.leave()
            }
            switch featuredPlaylist {
            case .success(let model):
                featuredPlaylistResponse = model
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        APIManager.shared.getRecommendedGenres { result in
            switch result {
            case .success(let model):
                let genres = model.genres
                var seeds = Set<String>()
                while seeds.count < 5 {
                    if let randomElement = genres.randomElement() {
                        seeds.insert(randomElement)
                    }
                }
                
                APIManager.shared.getRecommendations(with: seeds) {
                    recommendedResult in
                    defer {
                        group.leave()
                    }
                    switch recommendedResult {
                    case .success(let model):
                        recommendationsResponse = model
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // Notify Group Done fetching work from API
        group.notify(queue: .main) {
            guard let newAlbums = newReleaseResponse?.albums.items, let playlists = featuredPlaylistResponse?.playlists.items, let tracks = recommendationsResponse?.tracks else {
                fatalError("view models are nil")
            }
            self.configureModels(newAlbums: newAlbums, tracks: tracks, playlists: playlists)
        }
        
    }
    
    // MARK: - Configure Models
    private func configureModels(newAlbums: [Album], tracks: [AudioTrack], playlists: [Playlist]) {
        self.newAlbums = newAlbums
        self.playlists = playlists
        self.tracks = tracks
        sections.append(.newReleases(viewModels: newAlbums.compactMap({
            return NewReleasesViewModel(name: $0.name, artworkURL: URL(string: $0.images.first?.url ?? ""), numberOfTracks: $0.total_tracks, artistName: $0.artists.first?.name ?? "-")
        })))
        sections.append(.featuredPlaylists(viewModels: playlists.compactMap({
            return FeaturedPlaylistViewModel(name: $0.name, artworkURL: URL(string: $0.images.first?.url ?? ""), creatorName: $0.owner.display_name)
        })))
        sections.append(.recommendedTracks(viewModels: tracks.compactMap({
            return RecommendedTrackViewModel(artist: $0.name, artistName: $0.artists.first?.name ?? "-", artworkURL: URL(string: $0.album?.images.first?.url ?? ""))
        })))
        collectionView.reloadData()
    }
    
    @objc func didTapSettings() {
        let profileVC = SettingsVC()
        profileVC.title = "Settings"
        profileVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case .newReleases(let  viewModels):
            return viewModels.count
        case .featuredPlaylists(let viewModels):
            return viewModels.count
        case .recommendedTracks(let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type {
        case .newReleases(let  viewModels):
            guard let newReleasesCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewReleasesCollectionViewCell.identitifer, for: indexPath) as? NewReleasesCollectionViewCell else { return UICollectionViewCell() }
            let viewModel = viewModels[indexPath.row]
            newReleasesCell.configure(with: viewModel)
            return newReleasesCell
        case .featuredPlaylists(let viewModels):
            guard let playlistsCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedPlaylistsCollectionViewCell.identifier, for: indexPath) as? FeaturedPlaylistsCollectionViewCell else { return UICollectionViewCell() }
            playlistsCell.configure(with: viewModels[indexPath.row])
            return playlistsCell
        case .recommendedTracks(let viewModels):
            guard let tracksCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedTrackCollectionViewCell.identifier, for: indexPath) as? RecommendedTrackCollectionViewCell else { return UICollectionViewCell() }
            tracksCell.configure(with: viewModels[indexPath.row])
            return tracksCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let section = sections[indexPath.section]
        switch section {
        case .newReleases:
            let album = newAlbums[indexPath.row]
            let albumVC = AlbumVC(album: album)
            albumVC.title = album.name
            albumVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(albumVC, animated: true)
        case .featuredPlaylists:
            let playlist = playlists[indexPath.row]
            let playlistVC = PlaylistVC(playlist: playlist)
            playlistVC.title = playlist.name
            playlistVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(playlistVC, animated: true)
        case .recommendedTracks:
            let track = tracks[indexPath.row]
        
            if (tracks[indexPath.row].preview_url == nil) {
                let noTracksAlert = UIAlertController(title: "No Audio Track", message: "There are no audio tracks associated with this item", preferredStyle: .alert)

                noTracksAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                self.present(noTracksAlert, animated: true)
            } else {
                PlayCoordinator.shared.startPlayback(from: self, track: track)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: TitleHeaderCollectionReusableView.identifier,
            for: indexPath
        ) as? TitleHeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let section = indexPath.section
        let title = sections[section].title
        header.configure(with: title)
        return header
    }
    
    // MARK: - Create Collection Sections
    static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        let supplementaryViews = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(50)
                ),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        
        switch section {
        case 0:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // Vertical group in horizontal group
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(390)
                ),
                subitem: item,
                count: 3
            )
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.9),
                    heightDimension: .absolute(390)
                ),
                subitem: verticalGroup,
                count: 1
            )
            
            // Section
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            section.boundarySupplementaryItems = supplementaryViews
            return section
        case 1:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(200)
                )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(400)
                ),
                subitem: item,
                count: 2
            )
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(400)
                ),
                subitem: verticalGroup,
                count: 1
            )
            
            // Section
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = supplementaryViews
            return section
        case 2:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(80)
                ),
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            return section
        default:
            // Item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(390)
                ),
                subitem: item,
                count: 1
            )
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            return section
        }
    }
}

