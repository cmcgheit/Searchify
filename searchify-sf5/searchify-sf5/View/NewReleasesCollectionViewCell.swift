//
//  Made with ❤ and ☕ 
//

import UIKit
import SDWebImage

class NewReleasesCollectionViewCell: UICollectionViewCell {
    
    static let identitifer = "NewReleasesCollectionCell"
    
    private let albumCoverImageView:  UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let albumNameLabel = UILabel()
        albumNameLabel.font = . systemFont(ofSize: 18, weight: .semibold)
        albumNameLabel.numberOfLines = 0
        return albumNameLabel
    }()
    
    private let numberOfTracksLabel: UILabel = {
        let numberOfTracksLabel = UILabel()
        numberOfTracksLabel.font = . systemFont(ofSize: 17, weight: .thin)
        numberOfTracksLabel.numberOfLines = 0
        return numberOfTracksLabel
    }()
    
    private let artistNameLabel: UILabel = {
        let artistNameLabel = UILabel()
        artistNameLabel.font = . systemFont(ofSize: 16, weight: .light)
        artistNameLabel.numberOfLines = 0
        return artistNameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(numberOfTracksLabel)
        contentView.clipsToBounds = true
        contentView.addSubview(artistNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height-10
        let albumLabelSize = albumNameLabel.sizeThatFits(
            CGSize(
                width: contentView.width-imageSize-10,
                height: contentView.height-10
            )
        )
        artistNameLabel.sizeToFit()
        numberOfTracksLabel.sizeToFit()
        
        albumCoverImageView.frame = CGRect(x: 5, y: 5, width: imageSize, height: imageSize)
        
        let albumLabelHeight = min(60, albumLabelSize.height)
        albumNameLabel.frame = CGRect(x: albumCoverImageView.right + 10, y: 5, width: albumLabelSize.width, height: albumLabelHeight)
        artistNameLabel.frame = CGRect(x: albumCoverImageView.right + 10, y: albumNameLabel.bottom, width: contentView.width - albumCoverImageView.right - 10, height: 30)
        numberOfTracksLabel.frame = CGRect(x: albumCoverImageView.right + 10, y: contentView.bottom-44, width: numberOfTracksLabel.width, height: 44)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumNameLabel.text = nil
        artistNameLabel.text = nil
        numberOfTracksLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    func configure(with viewModel: NewReleasesViewModel) {
        albumNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        numberOfTracksLabel.text = "Tracks: \(viewModel.numberOfTracks)"
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, placeholderImage: UIImage(named: "default-music-note"), completed: nil)
    }
}
