//
//  Made with ❤ and ☕ 
//

import UIKit
import SDWebImage

class ProfileVC: UIViewController {
    
    private var models = [String]()
    
    private let profileTableVIew: UITableView = {
        let profileTableView = UITableView()
        profileTableView.isHidden = true
        profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: "profileTableCell")
        return profileTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground
        profileTableVIew.delegate = self
        profileTableVIew.dataSource = self
        view.addSubview(profileTableVIew)
        getUserProfile()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileTableVIew.frame = view.bounds
    }
    
    private func getUserProfile() {
        APIManager.shared.getCurrentUserProfile { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.updateUI(with: model)
                    break
                case .failure(let error):
                    print("Profile error : \(error.localizedDescription)")
                    self?.failedToGetUserProfile()
                }
            }
        }
        
    }
    
    private func updateUI(with model: UserProfile) {
        profileTableVIew.isHidden = false
        models.append("Full Name: \(model.display_name)")
        models.append("Email: \(model.email)")
        models.append("User ID: \(model.id)")
        createTableHeader(with: model.images.first?.url)
        profileTableVIew.reloadData()
    }
    
    // MARK: - Create Tab Header
    private func createTableHeader(with string: String?) {
        guard let urlString = string, let url = URL(string: urlString) else {
            return
        }
        
        let profileHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/1.5))
        let imageSize: CGFloat = profileHeader.height / 2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        profileHeader.addSubview(imageView)
        imageView.center = profileHeader.center
        imageView.contentMode = .scaleAspectFill
        imageView.sd_setImage(with: url, completed: nil)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize/2
        
        profileTableVIew.tableHeaderView = profileHeader
    }
    
    // MARK: - Failed to Get UserProfile
    private func failedToGetUserProfile() {
        let failedLabel = UILabel(frame: .zero)
        failedLabel.text = "Failed to load profile"
        failedLabel.sizeToFit()
        failedLabel.textColor = .secondaryLabel
        view.addSubview(failedLabel)
        failedLabel.center = view.center
    }
}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath)
        profileCell.textLabel?.text = models[indexPath.row]
        profileCell.selectionStyle = .none
        return profileCell
    }
}
