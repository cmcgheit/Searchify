//
//  Made with ❤ and ☕ 
//

import UIKit

class LibraryAlbumsVC: UIViewController {
    
    var albums = [Album]()
    private let noAlbumsView = NoUserAlbumsView()
    
    private let albumLibraryTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SearchResultsMultilineTableViewCell.self, forCellReuseIdentifier: SearchResultsMultilineTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(albumLibraryTableView)
        albumLibraryTableView.delegate = self
        albumLibraryTableView.dataSource = self
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        albumLibraryTableView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    
    @objc func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    private func fetchData() {
        albums.removeAll()
        APIManager.shared.getUserAlbums { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let albums):
                    self?.albums = albums
                    self?.updateUI()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI() {
        if albums.isEmpty {
            noAlbumsView.isHidden = false
            albumLibraryTableView.isHidden = true
        } else {
            albumLibraryTableView.reloadData()
            noAlbumsView.isHidden = true
            albumLibraryTableView.isHidden = false
        }
    }
}

extension LibraryAlbumsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let libraryAlbumsCell = tableView.dequeueReusableCell(withIdentifier: SearchResultsMultilineTableViewCell.identifier, for: indexPath) as? SearchResultsMultilineTableViewCell else { return UITableViewCell() }
        let album = albums[indexPath.row]
        libraryAlbumsCell.configure(
            with: SearchResultsMultilineViewModel(title: album.name, subTitle: album.artists.first?.name ?? "-", imageURL: URL(string: album.images.first?.url ?? "")))
        return libraryAlbumsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = albums[indexPath.row]
        let vc = AlbumVC(album: album)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
