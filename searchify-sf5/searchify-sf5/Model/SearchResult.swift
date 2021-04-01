//
//  Made with ❤ and ☕ 
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}

struct SearchSection {
    let title: String
    let results: [SearchResult]
}
