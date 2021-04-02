//
//  Made with ❤ and ☕ 
//

import UIKit
import SDWebImage

protocol PlaylistHeaderCollectionReusableViewDelegate: AnyObject {
    func playlistHeaderCollectionReusableViewDidTapPlayAll(_ header: PlaylistHeaderCollectionReusableView)
}

final class PlaylistHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "PlaylistHeaderCollectionReusableView"
    
    weak var delegate: PlaylistHeaderCollectionReusableViewDelegate?
    
    private let playlistHeaderNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let playlistDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let playlistOwnerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    private let playlistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private let playAllButton: UIButton = {
       let playButton = UIButton()
        playButton.backgroundColor = .systemGreen
        let playImage = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        playButton.setImage(playImage, for: .normal)
        playButton.tintColor = .white
        playButton.layer.cornerRadius = 30
        playButton.layer.masksToBounds = true
        return playButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(playlistHeaderNameLabel)
        addSubview(playlistDescriptionLabel)
        addSubview(playlistOwnerLabel)
        addSubview(playlistImageView)
        addSubview(playAllButton)
        
        playAllButton.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize: CGFloat = height/1.8
        playlistImageView.frame = CGRect(x: (width-imageSize)/2, y: 20, width: imageSize, height: imageSize)
        
        playlistHeaderNameLabel.frame = CGRect(x: 10, y: playlistImageView.bottom, width: width - 20, height: 44)
        playlistDescriptionLabel.frame = CGRect(x: 10, y: playlistHeaderNameLabel.bottom, width: width - 20, height: 44)
        playlistOwnerLabel.frame = CGRect(x: 10, y: playlistDescriptionLabel.bottom, width: width - 20, height: 44)
        
        playAllButton.frame = CGRect(x: width - 80, y: height - 80, width: 60, height: 60)
    }
    
    func configure(with viewModel: PlaylistHeaderViewViewModel) {
        playlistHeaderNameLabel.text = viewModel.name
        playlistDescriptionLabel.text = viewModel.description
        playlistOwnerLabel.text = viewModel.ownerName
        playlistImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
    
    // MARK: - Playlist Play Button
    @objc private func didTapPlayAll() {
        delegate?.playlistHeaderCollectionReusableViewDidTapPlayAll(self)
    }
    
}
