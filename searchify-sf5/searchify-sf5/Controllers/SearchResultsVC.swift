//
//  Made with ❤ and ☕ 
//

import UIKit

protocol SearchResultsVCDelegate: AnyObject {
    func didTapResult(_ result: SearchResult)
}

class SearchResultsVC: UIViewController {
    
    weak var delegate: SearchResultsVCDelegate?
    
    private var sectionResults: [SearchSection] = []
    
    private let searchTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: SearchResultsTableViewCell.identifier)
        tableView.register(SearchResultsMultilineTableViewCell.self, forCellReuseIdentifier: SearchResultsMultilineTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        view.addSubview(searchTableView)
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTableView.frame = view.bounds
    }
    
    func update(with results: [SearchResult]) {
        let artists = results.filter({
            switch $0 {
            case .artist: return true
            default: return false
            }
        })
        
        let albums = results.filter({
            switch $0 {
            case .album: return true
            default: return false
            }
        })
        
        let tracks = results.filter({
            switch $0 {
            case .track: return true
            default: return false
            }
        })
        
        let playlists = results.filter({
            switch $0 {
            case .playlist: return true
            default: return false
            }
        })
        
        self.sectionResults = [
            SearchSection(title: "Artists", results: artists),
            SearchSection(title: "Albums", results: albums),
            SearchSection(title: "Songs", results: tracks),
            SearchSection(title: "Playlists", results: playlists)
        ]
        
        searchTableView.reloadData()
        searchTableView.isHidden = results.isEmpty // hide results tableview if results empty
    }
}

extension SearchResultsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionResults.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionResults[section].results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = sectionResults[indexPath.section].results[indexPath.row]
        switch result {
        case .artist(let artist):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultsTableViewCell.identifier, for: indexPath) as? SearchResultsTableViewCell else { return  UITableViewCell() }
            let viewModel = SearchResultsViewModel(title: artist.name, imageURL: URL(string: artist.images?.first?.url ?? ""))
            cell.configure(with: viewModel)
            return cell
        case .album(model: let album):
            break
        case .track(model: let track):
            break
        case .playlist(model: let playlist):
            guard let playlistCell = tableView.dequeueReusableCell(withIdentifier: SearchResultsMultilineTableViewCell.identifier, for: indexPath) as? SearchResultsMultilineTableViewCell else { return  UITableViewCell() }
            let viewModel = SearchResultsMultilineViewModel(title: playlist.name, subTitle: playlist.owner.display_name, imageURL: URL(string: playlist.images.first?.url ?? ""))
            playlistCell.configure(with: viewModel)
            return playlistCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = sectionResults[indexPath.section].results[indexPath.row]
        delegate?.didTapResult(result)
//        let result = sectionResults[indexPath.section].results[indexPath.row]
//        switch result {
//        case .artist(let model):
//            break
//        case .album(let model):
//            let albumVC = AlbumVC(album: model)
//            albumVC.navigationItem.largeTitleDisplayMode = .never
//            navigationController?.pushViewController(albumVC, animated: true)
//        case .track(let model):
//            break
//        case .playlist(let model):
//            let playlistVC = PlaylistVC(playlist: model)
//            playlistVC.navigationItem.largeTitleDisplayMode = .never
//            navigationController?.pushViewController(playlistVC, animated: true)
//        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionResults[section].title
    }
}
