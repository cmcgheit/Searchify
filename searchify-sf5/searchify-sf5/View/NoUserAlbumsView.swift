//
//  Made with ❤ and ☕ 
//

import UIKit

protocol ActionLabelViewDelegate: AnyObject {
    func actionLabelViewDidTapButton(_ actionView: NoUserAlbumsView)
}

class NoUserAlbumsView: UIView {
    
    weak var delegate: ActionLabelViewDelegate?
    
    private let noAlbumsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let noAlbumsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        isHidden = true
        addSubview(noAlbumsLabel)
        addSubview(noAlbumsButton)
        noAlbumsButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        noAlbumsButton.frame = CGRect(x: 0, y: height-40, width: width, height: 40)
        noAlbumsLabel.frame = CGRect(x: 0, y: 0, width: width, height: height-45)
    }
    
    @objc func didTapButton() {
           delegate?.actionLabelViewDidTapButton(self)
       }
    
    func configure(with viewModel: NoUserAlbumsViewModel) {
        noAlbumsLabel.text = viewModel.text
        noAlbumsButton.setTitle(viewModel.actionTitle, for: .normal)
    }
}
