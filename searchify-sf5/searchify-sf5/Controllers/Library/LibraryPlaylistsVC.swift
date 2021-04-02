//
//  Made with ❤ and ☕ 
//

import UIKit

class LibraryPlaylistsVC: UIViewController {
    
    var playlists = [Playlist]()
    public var selectionHandler: ((Playlist) -> Void)?
    
    private let playlistsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchResultsMultilineTableViewCell.self, forCellReuseIdentifier: SearchResultsMultilineTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlaylists()
        
        view.addSubview(playlistsTableView)
        playlistsTableView.dataSource = self
        playlistsTableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playlistsTableView.frame = view.bounds
    }
    
    private func fetchPlaylists() {
        APIManager.shared.getUserPlaylists { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let userPlaylists):
                    self?.playlists = userPlaylists
                    self?.updateUI()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI() {
        if playlists.isEmpty {
            let noTracksAlert = UIAlertController(title: "No Playlists", message: "This user has no playlists.", preferredStyle: .alert)
            noTracksAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(noTracksAlert, animated: true)
            playlistsTableView.isHidden = true
        } else {
            playlistsTableView.isHidden = false
            playlistsTableView.reloadData()
        }
    }
}

extension LibraryPlaylistsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let playlistCell = tableView.dequeueReusableCell(withIdentifier: SearchResultsMultilineTableViewCell.identifier, for: indexPath) as? SearchResultsMultilineTableViewCell else { return UITableViewCell() }
        let playlist = playlists[indexPath.row]
        playlistCell.configure(with: SearchResultsMultilineViewModel(title: playlist.name, subTitle: playlist.owner.display_name, imageURL: URL(string: playlist.images.first?.url ?? "")))
        return playlistCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let playlist = playlists[indexPath.row]
        guard selectionHandler == nil else { selectionHandler?(playlist)
            dismiss(animated: true, completion: nil)
            return
        }
        
        let playerVC = PlaylistVC(playlist: playlist)
        playerVC.navigationItem.largeTitleDisplayMode = .never
        playerVC.isOwner = true
        navigationController?.pushViewController(playerVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
