//
//  Made with ❤ and ☕ 
//

import UIKit

class WelcomeVC: UIViewController {
    
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .systemGreen
        signInButton.setTitleColor(.white, for: .normal)
        return signInButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Searchify"
        view.backgroundColor = .systemBackground
        view.addSubview(signInButton)
        signInButton.addTarget(self, action:
                               #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20, y: view.height-50-view.safeAreaInsets.bottom, width: view.width-40, height: 50)
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
