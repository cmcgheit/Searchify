//
//  Made with ❤ and ☕ 
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct CategoryPlaylistResponse: Codable {
    let playlists: PlaylistResponse
}

struct Categories: Codable {
    let items: [Category]
}
