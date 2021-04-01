//
//  Made with ❤ and ☕ 
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {
    static let identifier = "SearchResultsTableViewCell"
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let searchIconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(searchLabel)
        contentView.addSubview(searchIconImageView)
        contentView.clipsToBounds = true
        accessoryType = . disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height - 10
        searchIconImageView.layer.cornerRadius = imageSize / 2
        searchIconImageView.layer.masksToBounds = true
        searchIconImageView.frame = CGRect(x: 10, y: 5, width: imageSize, height: imageSize)
        searchLabel.frame = CGRect(x: searchIconImageView.right + 10, y: 0, width: contentView.width-searchIconImageView.right - 15, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        searchLabel.text = nil
        searchIconImageView.image = nil
    }
    
    func configure(with viewModel: SearchResultsViewModel) {
        searchLabel.text = viewModel.title
        searchIconImageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }
    
}
