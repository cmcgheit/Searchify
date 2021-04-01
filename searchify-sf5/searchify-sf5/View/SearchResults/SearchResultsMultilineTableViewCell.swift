//
//  Made with ❤ and ☕ 
//

import UIKit

class SearchResultsMultilineTableViewCell: UITableViewCell {
    static let identifier = "SearchResultsMultilineTableViewCell"
    
    private let searchMultiLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let searchSecondaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let searchIconMultiImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(searchMultiLabel)
        contentView.addSubview(searchSecondaryLabel)
        contentView.addSubview(searchIconMultiImageView)
        
        contentView.clipsToBounds = true
        accessoryType = . disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height - 10
        searchIconMultiImageView.frame = CGRect(x: 10, y: 5, width: imageSize, height: imageSize)
        
        let labelHeight = contentView.height / 2
        searchMultiLabel.frame = CGRect(x: searchIconMultiImageView.right + 10, y: 0, width: contentView.width-searchIconMultiImageView.right - 15, height: contentView.height)
        searchSecondaryLabel.frame = CGRect(x:searchIconMultiImageView.right + 10 , y: labelHeight, width:contentView.width - searchIconMultiImageView.right - 15 , height: labelHeight)

      
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        searchMultiLabel.text = nil
        searchSecondaryLabel.text = nil
    }
    
    func configure(with viewModel: SearchResultsMultilineViewModel) {
        searchMultiLabel.text = viewModel.title
        searchSecondaryLabel.text = viewModel.subTitle
    }
    
}
