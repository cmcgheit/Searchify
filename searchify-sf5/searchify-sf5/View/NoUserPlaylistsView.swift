//
//  Made with ❤ and ☕ 
//

import UIKit

protocol NoUserPlaylistsDelegate: AnyObject {
    func actionLabelViewDidTapButton(_ actionView: NoUserPlaylistsView)
}

class NoUserPlaylistsView: UIView {
    
    weak var delegate: NoUserPlaylistsDelegate?
    
    private let noUserPlaylistslabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let noUserPlaylistButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        isHidden = true
        addSubview(noUserPlaylistslabel)
        addSubview(noUserPlaylistButton)
        
        noUserPlaylistButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func didTapButton() {
        delegate?.actionLabelViewDidTapButton(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        noUserPlaylistButton.frame = CGRect(x: 0, y: height-40, width: width, height: 40)
        noUserPlaylistslabel.frame = CGRect(x: 0, y: 0, width: width, height: height-45)
    }
    
    func configure(with viewModel: NoUserPlaylistsViewModel) {
        noUserPlaylistslabel.text = viewModel.text
        noUserPlaylistButton.setTitle(viewModel.actionTitle, for: .normal)
    }
}
