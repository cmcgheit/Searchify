//
//  Made with ❤ and ☕ 
//

import Foundation

struct PlayerControlsViewViewModel {
    let title: String?
    let subtitle: String?
}

protocol PlayerDataSource: AnyObject {
    var songName: String? { get }
    var subtitle: String? { get }
    var imageURL: URL? { get }
}
