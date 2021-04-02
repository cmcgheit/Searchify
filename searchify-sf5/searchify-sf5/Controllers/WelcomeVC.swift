//
//  Made with ❤ and ☕ 
//

import UIKit

class WelcomeVC: UIViewController {
    
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .white
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.darkGray, for: .normal)
        signInButton.layer.cornerRadius = 4
        return signInButton
    }()
    
    private let welcomeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "best-vinyl-albums")
        return imageView
    }()
    
    private let overlayView: UIView = {
       let view = UIView()
        view.backgroundColor = .darkGray
        view.alpha = 0.7
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Searchify"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeImageView)
        view.addSubview(overlayView) // add after imageView
        
        view.addSubview(signInButton)
        signInButton.addTarget(self, action:
                               #selector(didTapSignIn), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20, y: view.height - 30 - view.safeAreaInsets.bottom, width: view.width - 40, height: 50)
        welcomeImageView.frame = view.bounds
        overlayView.frame = view.bounds
    }
   
    @objc func didTapSignIn() {
        let authVC = AuthVC()
        authVC.completionHandler = { [weak self] success in
            self?.handleSignIn(success: success)
        }
        authVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(authVC, animated: true)
    }
    
    private func handleSignIn(success: Bool) {
        guard success else {
            let alert  = UIAlertController(title: "Oops",
                                           message: "Something went wrong while signing in",
                                           preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
            
        }
        
        let mainAppTabBarVC = TabBarVC()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }
}
