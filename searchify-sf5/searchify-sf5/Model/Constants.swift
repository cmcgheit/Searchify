//
//  Made with ❤ and ☕ 
//

import Foundation

struct Constants {
    
    static let clientID = "3d2408433c5e46aa8edb5aedd1a4f96e"
    static let secretClientID = "ace5dd29534147e1809e9c693dafefc0"
    static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    
    static let redirectURI = "https://cmcgheit.github.io"
    static let scopes = "user-read-private%20playlist-read-private%20user-follow-read%20user-library-read%20user-read-email"
    
    static let baseAPIURL = "https://api.spotify.com/v1"
}

// MARK: - User Profile JSON
//{
//    country = US;
//    "display_name" = "Carey McGhee";
//    email = "hbfamaila@yahoo.com";
//    "explicit_content" =     {
//        "filter_enabled" = 0;
//        "filter_locked" = 0;
//    };
//    "external_urls" =     {
//        spotify = "https://open.spotify.com/user/1251103207";
//    };
//    followers =     {
//        href = "<null>";
//        total = 7;
//    };
//    href = "https://api.spotify.com/v1/users/1251103207";
//    id = 1251103207;
//    images =     (
//                {
//            height = "<null>";
//            url = "https://scontent-ort2-2.xx.fbcdn.net/v/t31.0-1/c0.0.320.320a/p320x320/10469167_10152585517948650_41787500386789973_o.jpg?_nc_cat=107&ccb=1-3&_nc_sid=0c64ff&_nc_ohc=tklBH1HbPy4AX89-SPp&_nc_ht=scontent-ort2-2.xx&tp=27&oh=b0944a5e7e1ab917c1809ad249dacc88&oe=608549B6";
//            width = "<null>";
//        }
//    );
//    product = open;
//    type = user;
//    uri = "spotify:user:1251103207";
//}

// MARK: - New Releases JSON
//{
//    albums =     {
//        href = "https://api.spotify.com/v1/browse/new-releases?offset=0&limit=1";
//        items =         (
//                        {
//                "album_type" = single;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/7jVv8c5Fj3E9VhNjxT4snq";
//                        };
//                        href = "https://api.spotify.com/v1/artists/7jVv8c5Fj3E9VhNjxT4snq";
//                        id = 7jVv8c5Fj3E9VhNjxT4snq;
//                        name = "Lil Nas X";
//                        type = artist;
//                        uri = "spotify:artist:7jVv8c5Fj3E9VhNjxT4snq";
//                    }
//                );
//                "available_markets" =                 (
//                    AE,
//                    AM,
//                    AU,
//                    IL
//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/5iZytG7j5DDp9RlsmkGI97";
//                };
//                href = "https://api.spotify.com/v1/albums/5iZytG7j5DDp9RlsmkGI97";
//                id = 5iZytG7j5DDp9RlsmkGI97;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b273ddb9cf14094fa5b3f8683b14";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e02ddb9cf14094fa5b3f8683b14";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d00004851ddb9cf14094fa5b3f8683b14";
//                        width = 64;
//                    }
//                );
//                name = "MONTERO (Call Me By Your Name)";
//                "release_date" = "2021-03-26";
//                "release_date_precision" = day;
//                "total_tracks" = 1;
//                type = album;
//                uri = "spotify:album:5iZytG7j5DDp9RlsmkGI97";
//            }
//        );
//        limit = 1;
//        next = "https://api.spotify.com/v1/browse/new-releases?offset=1&limit=1";
//        offset = 0;
//        previous = "<null>";
//        total = 100;
//    };
//}
 
// MARK: - Featured Playlist JSON example
//{
//    message = "Selecci\U00f3n del editor";
//    playlists =     {
//        href = "https://api.spotify.com/v1/browse/featured-playlists?timestamp=2021-03-27T08%3A41%3A28&offset=0&limit=2";
//        items =         (
//                        {
//                collaborative = 0;
//                description = "It's the day after and the last thing you need is loud noises.";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DWUGsgkESc7qP";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWUGsgkESc7qP";
//                id = 37i9dQZF1DWUGsgkESc7qP;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f00000003b0cdd83e7f214cb6d884f0dd";
//                        width = "<null>";
//                    }
//                );
//                name = "Hangover Friendly";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTYxNjgzNDQzNywwMDAwMDAwMGQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0Mjdl;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWUGsgkESc7qP/tracks";
//                    total = 100;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DWUGsgkESc7qP";
//            },
//                        {
//                collaborative = 0;
//                description = "New age music for balancing mind and body.";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DX9uKNf5jGX6m";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX9uKNf5jGX6m";
//                id = 37i9dQZF1DX9uKNf5jGX6m;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f000000034ba00eaa7b36e3001a201f8f";
//                        width = "<null>";
//                    }
//                );
//                name = "Yoga & Meditation";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTYxNjUyNjEwMSwwMDAwMDA3NjAwMDAwMTc4NjA3NmNjOTMwMDAwMDE2ZDE1MzJkNWUy;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX9uKNf5jGX6m/tracks";
//                    total = 204;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DX9uKNf5jGX6m";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/browse/featured-playlists?timestamp=2021-03-27T08%3A41%3A28&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 12;
//    };
//}
//

// MARK: - Recommendation Response JSON
//tracks =     (
//            {
//        album =             {
//            "album_type" = SINGLE;
//            artists =                 (
//                                    {
//                    "external_urls" =                         {
//                        spotify = "https://open.spotify.com/artist/3mIj9lX2MWuHmhNCA7LSCW";
//                    };
//                    href = "https://api.spotify.com/v1/artists/3mIj9lX2MWuHmhNCA7LSCW";
//                    id = 3mIj9lX2MWuHmhNCA7LSCW;
//                    name = "The 1975";
//                    type = artist;
//                    uri = "spotify:artist:3mIj9lX2MWuHmhNCA7LSCW";
//                }
//            );
//            "available_markets" =                 (
//            );
//            "external_urls" =                 {
//                spotify = "https://open.spotify.com/album/0CZ4kD2nQNuaPXc16qgAky";
//            };
//            href = "https://api.spotify.com/v1/albums/0CZ4kD2nQNuaPXc16qgAky";
//            id = 0CZ4kD2nQNuaPXc16qgAky;
//            images =                 (
//                                    {
//                    height = 640;
//                    url = "https://i.scdn.co/image/ab67616d0000b27301d360fd886ac71be7a373bb";
//                    width = 640;
//                },
//                                    {
//                    height = 300;
//                    url = "https://i.scdn.co/image/ab67616d00001e0201d360fd886ac71be7a373bb";
//                    width = 300;
//                },
//                                    {
//                    height = 64;
//                    url = "https://i.scdn.co/image/ab67616d0000485101d360fd886ac71be7a373bb";
//                    width = 64;
//                }
//            );
//            name = "Love It If We Made It";
//            "release_date" = "2018-07-19";
//            "release_date_precision" = day;
//            "total_tracks" = 1;
//            type = album;
//            uri = "spotify:album:0CZ4kD2nQNuaPXc16qgAky";
//        };
//        artists =             (
//                            {
//                "external_urls" =                     {
//                    spotify = "https://open.spotify.com/artist/3mIj9lX2MWuHmhNCA7LSCW";
//                };
//                href = "https://api.spotify.com/v1/artists/3mIj9lX2MWuHmhNCA7LSCW";
//                id = 3mIj9lX2MWuHmhNCA7LSCW;
//                name = "The 1975";
//                type = artist;
//                uri = "spotify:artist:3mIj9lX2MWuHmhNCA7LSCW";
//            }
//        );
//        "available_markets" =             (
//        );
//        "disc_number" = 1;
//        "duration_ms" = 253249;
//        explicit = 1;
//        "external_ids" =             {
//            isrc = GBK3W1800771;
//        };
//        "external_urls" =             {
//            spotify = "https://open.spotify.com/track/7MRY4VpCuZvBmFda6ZCk2G";
//        };
//        href = "https://api.spotify.com/v1/tracks/7MRY4VpCuZvBmFda6ZCk2G";
//        id = 7MRY4VpCuZvBmFda6ZCk2G;
//        "is_local" = 0;
//        name = "Love It If We Made It";
//        popularity = 0;
//        "preview_url" = "<null>";
//        "track_number" = 1;
//        type = track;
//        uri = "spotify:track:7MRY4VpCuZvBmFda6ZCk2G";
//    },
//            {
//        album =             {
//            "album_type" = ALBUM;
//            artists =                 (
//                                    {
//                    "external_urls" =                         {
//                        spotify = "https://open.spotify.com/artist/450o9jw6AtiQlQkHCdH6Ru";
//                    };
//                    href = "https://api.spotify.com/v1/artists/450o9jw6AtiQlQkHCdH6Ru";
//                    id = 450o9jw6AtiQlQkHCdH6Ru;
//                    name = Funkadelic;
//                    type = artist;
//                    uri = "spotify:artist:450o9jw6AtiQlQkHCdH6Ru";
//                }
//            );
//            "available_markets" =                 (
//            );
//            "external_urls" =                 {
//                spotify = "https://open.spotify.com/album/5bTN2jvYpoJW03IRIk4kuS";
//            };
//            href = "https://api.spotify.com/v1/albums/5bTN2jvYpoJW03IRIk4kuS";
//            id = 5bTN2jvYpoJW03IRIk4kuS;
//            images =                 (
//                                    {
//                    height = 640;
//                    url = "https://i.scdn.co/image/ab67616d0000b27335ec2b1e0e3e9bff55decbae";
//                    width = 640;
//                },
//                                    {
//                    height = 300;
//                    url = "https://i.scdn.co/image/ab67616d00001e0235ec2b1e0e3e9bff55decbae";
//                    width = 300;
//                },
//                                    {
//                    height = 64;
//                    url = "https://i.scdn.co/image/ab67616d0000485135ec2b1e0e3e9bff55decbae";
//                    width = 64;
//                }
//            );
//            name = "Standing On The Verge Of Getting It On";
//            "release_date" = "1974-04-29";
//            "release_date_precision" = day;
//            "total_tracks" = 9;
//            type = album;
//            uri = "spotify:album:5bTN2jvYpoJW03IRIk4kuS";
//        };
//        artists =             (
//                            {
//                "external_urls" =                     {
//                    spotify = "https://open.spotify.com/artist/450o9jw6AtiQlQkHCdH6Ru";
//                };
//                href = "https://api.spotify.com/v1/artists/450o9jw6AtiQlQkHCdH6Ru";
//                id = 450o9jw6AtiQlQkHCdH6Ru;
//                name = Funkadelic;
//                type = artist;
//                uri = "spotify:artist:450o9jw6AtiQlQkHCdH6Ru";
//            }
//        );
//        "available_markets" =             (
//        );
//        "disc_number" = 1;
//        "duration_ms" = 307266;
//        explicit = 0;
//        "external_ids" =             {
//            isrc = US25X0588987;
//        };
//        "external_urls" =             {
//            spotify = "https://open.spotify.com/track/06ObEGGlc8iwNI3vmtRm1s";
//        };
//        href = "https://api.spotify.com/v1/tracks/06ObEGGlc8iwNI3vmtRm1s";
//        id = 06ObEGGlc8iwNI3vmtRm1s;
//        "is_local" = 0;
//        name = "Standing On The Verge Of Getting It On";
//        popularity = 0;
//        "preview_url" = "<null>";
//        "track_number" = 5;
//        type = track;
//        uri = "spotify:track:06ObEGGlc8iwNI3vmtRm1s";
//    }
//);
//}

// MARK: - Album Details JSON

//{
//    "album_type" = single;
//    artists =     (
//                {
//            "external_urls" =             {
//                spotify = "https://open.spotify.com/artist/7jVv8c5Fj3E9VhNjxT4snq";
//            };
//            href = "https://api.spotify.com/v1/artists/7jVv8c5Fj3E9VhNjxT4snq";
//            id = 7jVv8c5Fj3E9VhNjxT4snq;
//            name = "Lil Nas X";
//            type = artist;
//            uri = "spotify:artist:7jVv8c5Fj3E9VhNjxT4snq";
//        }
//    );
//    "available_markets" =     (
//        AD,
//        AE,
//        AG,
//        AL,
//    );
//    copyrights =     (
//                {
//            text = "(P) 2021 Columbia Records, a Division of Sony Music Entertainment";
//            type = P;
//        }
//    );
//    "external_ids" =     {
//        upc = 886449068012;
//    };
//    "external_urls" =     {
//        spotify = "https://open.spotify.com/album/5iZytG7j5DDp9RlsmkGI97";
//    };
//    genres =     (
//    );
//    href = "https://api.spotify.com/v1/albums/5iZytG7j5DDp9RlsmkGI97";
//    id = 5iZytG7j5DDp9RlsmkGI97;
//    images =     (
//                {
//            height = 640;
//            url = "https://i.scdn.co/image/ab67616d0000b273ddb9cf14094fa5b3f8683b14";
//            width = 640;
//        },
//                {
//            height = 300;
//            url = "https://i.scdn.co/image/ab67616d00001e02ddb9cf14094fa5b3f8683b14";
//            width = 300;
//        },
//                {
//            height = 64;
//            url = "https://i.scdn.co/image/ab67616d00004851ddb9cf14094fa5b3f8683b14";
//            width = 64;
//        }
//    );
//    label = Columbia;
//    name = "MONTERO (Call Me By Your Name)";
//    popularity = 77;
//    "release_date" = "2021-03-26";
//    "release_date_precision" = day;
//    "total_tracks" = 1;
//    tracks =     {
//        href = "https://api.spotify.com/v1/albums/5iZytG7j5DDp9RlsmkGI97/tracks?offset=0&limit=50";
//        items =         (
//                        {
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/7jVv8c5Fj3E9VhNjxT4snq";
//                        };
//                        href = "https://api.spotify.com/v1/artists/7jVv8c5Fj3E9VhNjxT4snq";
//                        id = 7jVv8c5Fj3E9VhNjxT4snq;
//                        name = "Lil Nas X";
//                        type = artist;
//                        uri = "spotify:artist:7jVv8c5Fj3E9VhNjxT4snq";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL,
//                    AM,
//                );
//                "disc_number" = 1;
//                "duration_ms" = 137875;
//                explicit = 1;
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/track/3BZEcbdtXQSo7OrvKRJ6mb";
//                };
//                href = "https://api.spotify.com/v1/tracks/3BZEcbdtXQSo7OrvKRJ6mb";
//                id = 3BZEcbdtXQSo7OrvKRJ6mb;
//                "is_local" = 0;
//                name = "MONTERO (Call Me By Your Name)";
//                "preview_url" = "https://p.scdn.co/mp3-preview/fee76abaab41300456289022f468959d7ab899b5?cid=3d2408433c5e46aa8edb5aedd1a4f96e";
//                "track_number" = 1;
//                type = track;
//                uri = "spotify:track:3BZEcbdtXQSo7OrvKRJ6mb";
//            }
//        );
//        limit = 50;
//        next = "<null>";
//        offset = 0;
//        previous = "<null>";
//        total = 1;
//    };
//    type = album;
//    uri = "spotify:album:5iZytG7j5DDp9RlsmkGI97";
//}

// MARK: - Featured Playlist Details JSON
//{
//    collaborative = 0;
//    description = "Peak-time bangers and emerging future hits. Cover: Phil The Beat, ILIRA";
//    "external_urls" =     {
//        spotify = "https://open.spotify.com/playlist/37i9dQZF1DX7ZUug1ANKRP";
//    };
//    followers =     {
//        href = "<null>";
//        total = 1528679;
//    };
//    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX7ZUug1ANKRP";
//    id = 37i9dQZF1DX7ZUug1ANKRP;
//    images =     (
//                {
//            height = "<null>";
//            url = "https://i.scdn.co/image/ab67706f00000003ff134ee023fb609198f2ca08";
//            width = "<null>";
//        }
//    );
//    name = "Main Stage";
//    owner =     {
//        "display_name" = Spotify;
//        "external_urls" =         {
//            spotify = "https://open.spotify.com/user/spotify";
//        };
//        href = "https://api.spotify.com/v1/users/spotify";
//        id = spotify;
//        type = user;
//        uri = "spotify:user:spotify";
//    };
//    "primary_color" = "#ffffff";
//    public = 1;
//    "snapshot_id" = MTYxNjYwNDc0OSwwMDAwMDE0NDAwMDAwMTc4NjUyNmUwODkwMDAwMDE3ODY0MGU1NzQ0;
//    tracks =     {
//        href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX7ZUug1ANKRP/tracks?offset=0&limit=100";
//        items =         (
//                        {
//                "added_at" = "2021-03-24T16:52:29Z";
//                "added_by" =                 {
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/";
//                    };
//                    href = "https://api.spotify.com/v1/users/";
//                    id = "";
//                    type = user;
//                    uri = "spotify:user:";
//                };
//                "is_local" = 0;
//                "primary_color" = "<null>";
//                track =                 {
//                    album =                     {
//                        "album_type" = single;
//                        artists =                         (
//                                                        {
//                                "external_urls" =                                 {
//                                    spotify = "https://open.spotify.com/artist/35pKZ36ma78w8aE467fRO9";
//                                };
//                                href = "https://api.spotify.com/v1/artists/35pKZ36ma78w8aE467fRO9";
//                                id = 35pKZ36ma78w8aE467fRO9;
//                                name = "Phil The Beat";
//                                type = artist;
//                                uri = "spotify:artist:35pKZ36ma78w8aE467fRO9";
//                            },
//                                                        {
//                                "external_urls" =                                 {
//                                    spotify = "https://open.spotify.com/artist/6mzs66iVW15C5iLt0JLt41";
//                                };
//                                href = "https://api.spotify.com/v1/artists/6mzs66iVW15C5iLt0JLt41";
//                                id = 6mzs66iVW15C5iLt0JLt41;
//                                name = ILIRA;
//                                type = artist;
//                                uri = "spotify:artist:6mzs66iVW15C5iLt0JLt41";
//                            }
//                        );
//                        "available_markets" =                         (
//                            AD,
//                            AE,
//                            AG,
//                            AL,
//                            AM,
//                            AO
//                        );
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/album/6eDNIUfe63AsdaFw3R4abu";
//                        };
//                        href = "https://api.spotify.com/v1/albums/6eDNIUfe63AsdaFw3R4abu";
//                        id = 6eDNIUfe63AsdaFw3R4abu;
//                        images =                         (
//                                                        {
//                                height = 640;
//                                url = "https://i.scdn.co/image/ab67616d0000b27332604504f8402c93a969f4b9";
//                                width = 640;
//                            },
//                                                        {
//                                height = 300;
//                                url = "https://i.scdn.co/image/ab67616d00001e0232604504f8402c93a969f4b9";
//                                width = 300;
//                            },
//                                                        {
//                                height = 64;
//                                url = "https://i.scdn.co/image/ab67616d0000485132604504f8402c93a969f4b9";
//                                width = 64;
//                            }
//                        );
//                        name = Anytime;
//                        "release_date" = "2021-03-05";
//                        "release_date_precision" = day;
//                        "total_tracks" = 1;
//                        type = album;
//                        uri = "spotify:album:6eDNIUfe63AsdaFw3R4abu";
//                    };
//                    artists =                     (
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/35pKZ36ma78w8aE467fRO9";
//                            };
//                            href = "https://api.spotify.com/v1/artists/35pKZ36ma78w8aE467fRO9";
//                            id = 35pKZ36ma78w8aE467fRO9;
//                            name = "Phil The Beat";
//                            type = artist;
//                            uri = "spotify:artist:35pKZ36ma78w8aE467fRO9";
//                        },
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/6mzs66iVW15C5iLt0JLt41";
//                            };
//                            href = "https://api.spotify.com/v1/artists/6mzs66iVW15C5iLt0JLt41";
//                            id = 6mzs66iVW15C5iLt0JLt41;
//                            name = ILIRA;
//                            type = artist;
//                            uri = "spotify:artist:6mzs66iVW15C5iLt0JLt41";
//                        }
//                    );
//                    "available_markets" =                     (
//                        AD,
//                        AE,
//                        AG,
//                        AL,
//                        AM,
//                       A0
//                    );
//                    "disc_number" = 1;
//                    "duration_ms" = 148500;
//                    episode = 0;
//                    explicit = 0;
//                    "external_ids" =                     {
//                        isrc = DEA622100263;
//                    };
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/track/4pAxG2OEh4LSNuZFzDRUbN";
//                    };
//                    href = "https://api.spotify.com/v1/tracks/4pAxG2OEh4LSNuZFzDRUbN";
//                    id = 4pAxG2OEh4LSNuZFzDRUbN;
//                    "is_local" = 0;
//                    name = Anytime;
//                    popularity = 55;
//                    "preview_url" = "https://p.scdn.co/mp3-preview/a8ee3ac8a422f7b477b52e1f849e323649bd0866?cid=3d2408433c5e46aa8edb5aedd1a4f96e";
//                    track = 1;
//                    "track_number" = 1;
//                    type = track;
//                    uri = "spotify:track:4pAxG2OEh4LSNuZFzDRUbN";
//                };
//                "video_thumbnail" =                 {
//                    url = "<null>";
//                };
//            },
//                        {
//                "added_at" = "2021-03-24T16:52:29Z";
//                "added_by" =                 {
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/";
//                    };
//                    href = "https://api.spotify.com/v1/users/";
//                    id = "";
//                    type = user;
//                    uri = "spotify:user:";
//                };
//                "is_local" = 0;
//                "primary_color" = "<null>";
//                track =                 {
//                    album =                     {
//                        "album_type" = single;
//                        artists =                         (
//                                                        {
//                                "external_urls" =                                 {
//                                    spotify = "https://open.spotify.com/artist/5f5mH9BDkeyXmDbzevu38d";
//                                };
//                                href = "https://api.spotify.com/v1/artists/5f5mH9BDkeyXmDbzevu38d";
//                                id = 5f5mH9BDkeyXmDbzevu38d;
//                                name = Alfons;
//                                type = artist;
//                                uri = "spotify:artist:5f5mH9BDkeyXmDbzevu38d";
//                            }
//                        );
//
// MARK: - Search Response
//https://api.spotify.com/v1/search?limit=10&type=album,artist,playlist,track&q=B
//B (when this letter typed)
//https://api.spotify.com/v1/search?limit=10&type=album,artist,playlist,track&q=Be
//Be
//{
//    albums =     {
//        href = "https://api.spotify.com/v1/search?query=B&type=album&offset=0&limit=10";
//        items =         (
//                        {
//                "album_type" = album;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/246dkjvS1zLTtiykXe5h60";
//                        };
//                        href = "https://api.spotify.com/v1/artists/246dkjvS1zLTtiykXe5h60";
//                        id = 246dkjvS1zLTtiykXe5h60;
//                        name = "Post Malone";
//                        type = artist;
//                        uri = "spotify:artist:246dkjvS1zLTtiykXe5h60";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL,
//                    AM
//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/6trNtQUgC8cgbWcqoMYkOR";
//                };
//                href = "https://api.spotify.com/v1/albums/6trNtQUgC8cgbWcqoMYkOR";
//                id = 6trNtQUgC8cgbWcqoMYkOR;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b273b1c4b76e23414c9f20242268";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e02b1c4b76e23414c9f20242268";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d00004851b1c4b76e23414c9f20242268";
//                        width = 64;
//                    }
//                );
//                name = "beerbongs & bentleys";
//                "release_date" = "2018-04-27";
//                "release_date_precision" = day;
//                "total_tracks" = 18;
//                type = album;
//                uri = "spotify:album:6trNtQUgC8cgbWcqoMYkOR";
//            },
//                        {
//                "album_type" = album;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/246dkjvS1zLTtiykXe5h60";
//                        };
//                        href = "https://api.spotify.com/v1/artists/246dkjvS1zLTtiykXe5h60";
//                        id = 246dkjvS1zLTtiykXe5h60;
//                        name = "Post Malone";
//                        type = artist;
//                        uri = "spotify:artist:246dkjvS1zLTtiykXe5h60";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL,
//                    AM,
//                    AO,
//                    AR,
//                    AT,
//                    AU,
//                    AZ
//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/4g1ZRSobMefqF6nelkgibi";
//                };
//                href = "https://api.spotify.com/v1/albums/4g1ZRSobMefqF6nelkgibi";
//                id = 4g1ZRSobMefqF6nelkgibi;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b2739478c87599550dd73bfa7e02";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e029478c87599550dd73bfa7e02";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d000048519478c87599550dd73bfa7e02";
//                        width = 64;
//                    }
//                );
//                name = "Hollywood's Bleeding";
//                "release_date" = "2019-09-06";
//                "release_date_precision" = day;
//                "total_tracks" = 17;
//                type = album;
//                uri = "spotify:album:4g1ZRSobMefqF6nelkgibi";
//            },
//
//https://api.spotify.com/v1/search?limit=2&type=album,artist,playlist,track&q=Beyonce
//Beyonce // full word typed results (linit 2)
//{
//    albums =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonc&type=album&offset=0&limit=2";
//        items =         (
//                        {
//                "album_type" = album;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL,
//                    AM
//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/2UJwKSBUz6rtW4QLK74kQu";
//                };
//                href = "https://api.spotify.com/v1/albums/2UJwKSBUz6rtW4QLK74kQu";
//                id = 2UJwKSBUz6rtW4QLK74kQu;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b2730d1d6e9325275f104f8e33f3";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e020d1d6e9325275f104f8e33f3";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d000048510d1d6e9325275f104f8e33f3";
//                        width = 64;
//                    }
//                );
//                name = "BEYONC\U00c9 [Platinum Edition]";
//                "release_date" = "2014-11-24";
//                "release_date_precision" = day;
//                "total_tracks" = 20;
//                type = album;
//                uri = "spotify:album:2UJwKSBUz6rtW4QLK74kQu";
//            },
//                        {
//                "album_type" = album;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL,
//                    AM
//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/7dK54iZuOxXFarGhXwEXfF";
//                };
//                href = "https://api.spotify.com/v1/albums/7dK54iZuOxXFarGhXwEXfF";
//                id = 7dK54iZuOxXFarGhXwEXfF;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b27389992f4d7d4ab94937bf9e23";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e0289992f4d7d4ab94937bf9e23";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d0000485189992f4d7d4ab94937bf9e23";
//                        width = 64;
//                    }
//                );
//                name = Lemonade;
//                "release_date" = "2016-04-23";
//                "release_date_precision" = day;
//                "total_tracks" = 13;
//                type = album;
//                uri = "spotify:album:7dK54iZuOxXFarGhXwEXfF";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonc&type=album&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 899;
//    };
//    artists =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonc&type=artist&offset=0&limit=2";
//        items =         (
//                        {
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                };
//                followers =                 {
//                    href = "<null>";
//                    total = 26813285;
//                };
//                genres =                 (
//                    "dance pop",
//                    pop,
//                    "post-teen pop",
//                    "r&b"
//                );
//                href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                id = 6vWDO969PvNqNYHIOW5v0m;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ad8b0e5a18a5a443a2678768bd73f59833941abc";
//                        width = 640;
//                    },
//                                        {
//                        height = 320;
//                        url = "https://i.scdn.co/image/802895be7bc5339087ba36194b0b7307c467df96";
//                        width = 320;
//                    },
//                                        {
//                        height = 160;
//                        url = "https://i.scdn.co/image/a932ba0a31bd2807fe76c77b64c680bec2f3d14a";
//                        width = 160;
//                    }
//                );
//                name = "Beyonc\U00e9";
//                popularity = 89;
//                type = artist;
//                uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//            },
//                        {
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/artist/4idkg9ypAR0FDtWlDOH7v8";
//                };
//                followers =                 {
//                    href = "<null>";
//                    total = 7;
//                };
//                genres =                 (
//                );
//                href = "https://api.spotify.com/v1/artists/4idkg9ypAR0FDtWlDOH7v8";
//                id = 4idkg9ypAR0FDtWlDOH7v8;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b2731565d41c6bf8364b7f669747";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e021565d41c6bf8364b7f669747";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d000048511565d41c6bf8364b7f669747";
//                        width = 64;
//                    }
//                );
//                name = Beyoncais;
//                popularity = 28;
//                type = artist;
//                uri = "spotify:artist:4idkg9ypAR0FDtWlDOH7v8";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonc&type=artist&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 26;
//    };
//    playlists =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonc&type=playlist&offset=0&limit=2";
//        items =         (
//                        {
//                collaborative = 0;
//                description = description;
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/0iSnxZZJ89KaRNkqqup4XC";
//                };
//                href = "https://api.spotify.com/v1/playlists/0iSnxZZJ89KaRNkqqup4XC";
//                id = 0iSnxZZJ89KaRNkqqup4XC;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706c0000bebba1eca546979165310cc1533e";
//                        width = "<null>";
//                    }
//                );
//                name = "Beyonc\U00e9 Hits - All Songs";
//                owner =                 {
//                    "display_name" = "Christopher Mclaren";
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/x1zjvqmqhjsnb572sc000pt7s";
//                    };
//                    href = "https://api.spotify.com/v1/users/x1zjvqmqhjsnb572sc000pt7s";
//                    id = x1zjvqmqhjsnb572sc000pt7s;
//                    type = user;
//                    uri = "spotify:user:x1zjvqmqhjsnb572sc000pt7s";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = "MjU1LDUxMjQ2OGY5NGZkM2IzNzYxYzY0NmZjNzBjZmNjNTI5Nzg0Njc3YTA=";
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/0iSnxZZJ89KaRNkqqup4XC/tracks";
//                    total = 80;
//                };
//                type = playlist;
//                uri = "spotify:playlist:0iSnxZZJ89KaRNkqqup4XC";
//            },
//                        {
//                collaborative = 0;
//                description = "Queen Bey's most essential tracks, all in one playlist.";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DX2oU49YwtXI2";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX2oU49YwtXI2";
//                id = 37i9dQZF1DX2oU49YwtXI2;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f00000003e3e2727edc2f59616536f30b";
//                        width = "<null>";
//                    }
//                );
//                name = "This Is Beyonc\U00e9";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTU5NjE2ODA2MCwwMDAwMDAzNDAwMDAwMTczYTMwN2JkZjEwMDAwMDE3M2ExNzUyNWI3;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX2oU49YwtXI2/tracks";
//                    total = 52;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DX2oU49YwtXI2";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonc&type=playlist&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 23398;
//    };
//    tracks =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonc&type=track&offset=0&limit=2";
//        items =         (
//                        {
//                album =                 {
//                    "album_type" = single;
//                    artists =                     (
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/181bsRPaVXVlUKXrxwZfHK";
//                            };
//                            href = "https://api.spotify.com/v1/artists/181bsRPaVXVlUKXrxwZfHK";
//                            id = 181bsRPaVXVlUKXrxwZfHK;
//                            name = "Megan Thee Stallion";
//                            type = artist;
//                            uri = "spotify:artist:181bsRPaVXVlUKXrxwZfHK";
//                        },
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                            };
//                            href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                            id = 6vWDO969PvNqNYHIOW5v0m;
//                            name = "Beyonc\U00e9";
//                            type = artist;
//                            uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                        }
//                    );
//                    "available_markets" =                     (
//                        AD,
//                        AE,
//                        AG,
//                        AL
//                    );
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/album/6M4VOF1ExBRii1x20Pk0GR";
//                    };
//                    href = "https://api.spotify.com/v1/albums/6M4VOF1ExBRii1x20Pk0GR";
//                    id = 6M4VOF1ExBRii1x20Pk0GR;
//                    images =                     (
//                                                {
//                            height = 640;
//                            url = "https://i.scdn.co/image/ab67616d0000b273cd613f53a22b92b14694943c";
//                            width = 640;
//                        },
//                                                {
//                            height = 300;
//                            url = "https://i.scdn.co/image/ab67616d00001e02cd613f53a22b92b14694943c";
//                            width = 300;
//                        },
//                                                {
//                            height = 64;
//                            url = "https://i.scdn.co/image/ab67616d00004851cd613f53a22b92b14694943c";
//                            width = 64;
//                        }
//                    );
//                    name = "Savage Remix (feat. Beyonc\U00e9)";
//                    "release_date" = "2020-04-29";
//                    "release_date_precision" = day;
//                    "total_tracks" = 1;
//                    type = album;
//                    uri = "spotify:album:6M4VOF1ExBRii1x20Pk0GR";
//                };
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/181bsRPaVXVlUKXrxwZfHK";
//                        };
//                        href = "https://api.spotify.com/v1/artists/181bsRPaVXVlUKXrxwZfHK";
//                        id = 181bsRPaVXVlUKXrxwZfHK;
//                        name = "Megan Thee Stallion";
//                        type = artist;
//                        uri = "spotify:artist:181bsRPaVXVlUKXrxwZfHK";
//                    },
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL
//                );
//                "disc_number" = 1;
//                "duration_ms" = 242000;
//                explicit = 1;
//                "external_ids" =                 {
//                    isrc = QMCE32000145;
//                };
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/track/5v4GgrXPMghOnBBLmveLac";
//                };
//                href = "https://api.spotify.com/v1/tracks/5v4GgrXPMghOnBBLmveLac";
//                id = 5v4GgrXPMghOnBBLmveLac;
//                "is_local" = 0;
//                name = "Savage Remix (feat. Beyonc\U00e9)";
//                popularity = 78;
//                "preview_url" = "https://p.scdn.co/mp3-preview/82b86052d5cfa3802d47b4ee63036d2bfeb86525?cid=3d2408433c5e46aa8edb5aedd1a4f96e";
//                "track_number" = 1;
//                type = track;
//                uri = "spotify:track:5v4GgrXPMghOnBBLmveLac";
//            },
//                        {
//                album =                 {
//                    "album_type" = album;
//                    artists =                     (
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                            };
//                            href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                            id = 6vWDO969PvNqNYHIOW5v0m;
//                            name = "Beyonc\U00e9";
//                            type = artist;
//                            uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                        }
//                    );
//                    "available_markets" =                     (
//                        AD,
//                        AE,
//                        AG,
//                        AL
//                    );
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/album/6oxVabMIqCMJRYN1GqR3Vf";
//                    };
//                    href = "https://api.spotify.com/v1/albums/6oxVabMIqCMJRYN1GqR3Vf";
//                    id = 6oxVabMIqCMJRYN1GqR3Vf;
//                    images =                     (
//                                                {
//                            height = 640;
//                            url = "https://i.scdn.co/image/ab67616d0000b27345680a4a57c97894490a01c1";
//                            width = 640;
//                        },
//                                                {
//                            height = 300;
//                            url = "https://i.scdn.co/image/ab67616d00001e0245680a4a57c97894490a01c1";
//                            width = 300;
//                        },
//                                                {
//                            height = 64;
//                            url = "https://i.scdn.co/image/ab67616d0000485145680a4a57c97894490a01c1";
//                            width = 64;
//                        }
//                    );
//                    name = "Dangerously In Love";
//                    "release_date" = "2003-06-24";
//                    "release_date_precision" = day;
//                    "total_tracks" = 15;
//                    type = album;
//                    uri = "spotify:album:6oxVabMIqCMJRYN1GqR3Vf";
//                };
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    },
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/3nFkdlSjzX9mRTtwJOzDYB";
//                        };
//                        href = "https://api.spotify.com/v1/artists/3nFkdlSjzX9mRTtwJOzDYB";
//                        id = 3nFkdlSjzX9mRTtwJOzDYB;
//                        name = "JAY-Z";
//                        type = artist;
//                        uri = "spotify:artist:3nFkdlSjzX9mRTtwJOzDYB";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL
//                );
//                "disc_number" = 1;
//                "duration_ms" = 236133;
//                explicit = 0;
//                "external_ids" =                 {
//                    isrc = USSM10305425;
//                };
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/track/5IVuqXILoxVWvWEPm82Jxr";
//                };
//                href = "https://api.spotify.com/v1/tracks/5IVuqXILoxVWvWEPm82Jxr";
//                id = 5IVuqXILoxVWvWEPm82Jxr;
//                "is_local" = 0;
//                name = "Crazy In Love (feat. Jay-Z)";
//                popularity = 78;
//                "preview_url" = "https://p.scdn.co/mp3-preview/ce8ace0ec425840416be78db07cf50dd331eed4f?cid=3d2408433c5e46aa8edb5aedd1a4f96e";
//                "track_number" = 1;
//                type = track;
//                uri = "spotify:track:5IVuqXILoxVWvWEPm82Jxr";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonc&type=track&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 6478;
//    };
//}
//{
//    albums =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonce&type=album&offset=0&limit=2";
//        items =         (
//                        {
//                "album_type" = album;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL
//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/2UJwKSBUz6rtW4QLK74kQu";
//                };
//                href = "https://api.spotify.com/v1/albums/2UJwKSBUz6rtW4QLK74kQu";
//                id = 2UJwKSBUz6rtW4QLK74kQu;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b2730d1d6e9325275f104f8e33f3";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e020d1d6e9325275f104f8e33f3";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d000048510d1d6e9325275f104f8e33f3";
//                        width = 64;
//                    }
//                );
//                name = "BEYONC\U00c9 [Platinum Edition]";
//                "release_date" = "2014-11-24";
//                "release_date_precision" = day;
//                "total_tracks" = 20;
//                type = album;
//                uri = "spotify:album:2UJwKSBUz6rtW4QLK74kQu";
//            },
//                        {
//                "album_type" = album;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL
//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/7dK54iZuOxXFarGhXwEXfF";
//                };
//                href = "https://api.spotify.com/v1/albums/7dK54iZuOxXFarGhXwEXfF";
//                id = 7dK54iZuOxXFarGhXwEXfF;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b27389992f4d7d4ab94937bf9e23";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e0289992f4d7d4ab94937bf9e23";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d0000485189992f4d7d4ab94937bf9e23";
//                        width = 64;
//                    }
//                );
//                name = Lemonade;
//                "release_date" = "2016-04-23";
//                "release_date_precision" = day;
//                "total_tracks" = 13;
//                type = album;
//                uri = "spotify:album:7dK54iZuOxXFarGhXwEXfF";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonce&type=album&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 894;
//    };
//    artists =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonce&type=artist&offset=0&limit=2";
//        items =         (
//                        {
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                };
//                followers =                 {
//                    href = "<null>";
//                    total = 26813285;
//                };
//                genres =                 (
//                    "dance pop",
//                    pop,
//                    "post-teen pop",
//                    "r&b"
//                );
//                href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                id = 6vWDO969PvNqNYHIOW5v0m;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ad8b0e5a18a5a443a2678768bd73f59833941abc";
//                        width = 640;
//                    },
//                                        {
//                        height = 320;
//                        url = "https://i.scdn.co/image/802895be7bc5339087ba36194b0b7307c467df96";
//                        width = 320;
//                    },
//                                        {
//                        height = 160;
//                        url = "https://i.scdn.co/image/a932ba0a31bd2807fe76c77b64c680bec2f3d14a";
//                        width = 160;
//                    }
//                );
//                name = "Beyonc\U00e9";
//                popularity = 89;
//                type = artist;
//                uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//            },
//                        {
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/artist/4kmn7krzlJggDr3C00SoCF";
//                };
//                followers =                 {
//                    href = "<null>";
//                    total = 35;
//                };
//                genres =                 (
//                );
//                href = "https://api.spotify.com/v1/artists/4kmn7krzlJggDr3C00SoCF";
//                id = 4kmn7krzlJggDr3C00SoCF;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b273b3a8e66cd5045ece93622743";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e02b3a8e66cd5045ece93622743";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d00004851b3a8e66cd5045ece93622743";
//                        width = 64;
//                    }
//                );
//                name = "Beyonce Smith";
//                popularity = 7;
//                type = artist;
//                uri = "spotify:artist:4kmn7krzlJggDr3C00SoCF";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonce&type=artist&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 23;
//    };
//    playlists =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonce&type=playlist&offset=0&limit=2";
//        items =         (
//                        {
//                collaborative = 0;
//                description = description;
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/0iSnxZZJ89KaRNkqqup4XC";
//                };
//                href = "https://api.spotify.com/v1/playlists/0iSnxZZJ89KaRNkqqup4XC";
//                id = 0iSnxZZJ89KaRNkqqup4XC;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706c0000bebba1eca546979165310cc1533e";
//                        width = "<null>";
//                    }
//                );
//                name = "Beyonc\U00e9 Hits - All Songs";
//                owner =                 {
//                    "display_name" = "Christopher Mclaren";
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/x1zjvqmqhjsnb572sc000pt7s";
//                    };
//                    href = "https://api.spotify.com/v1/users/x1zjvqmqhjsnb572sc000pt7s";
//                    id = x1zjvqmqhjsnb572sc000pt7s;
//                    type = user;
//                    uri = "spotify:user:x1zjvqmqhjsnb572sc000pt7s";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = "MjU1LDUxMjQ2OGY5NGZkM2IzNzYxYzY0NmZjNzBjZmNjNTI5Nzg0Njc3YTA=";
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/0iSnxZZJ89KaRNkqqup4XC/tracks";
//                    total = 80;
//                };
//                type = playlist;
//                uri = "spotify:playlist:0iSnxZZJ89KaRNkqqup4XC";
//            },
//                        {
//                collaborative = 0;
//                description = "Queen Bey's most essential tracks, all in one playlist.";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DX2oU49YwtXI2";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX2oU49YwtXI2";
//                id = 37i9dQZF1DX2oU49YwtXI2;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f00000003e3e2727edc2f59616536f30b";
//                        width = "<null>";
//                    }
//                );
//                name = "This Is Beyonc\U00e9";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTU5NjE2ODA2MCwwMDAwMDAzNDAwMDAwMTczYTMwN2JkZjEwMDAwMDE3M2ExNzUyNWI3;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX2oU49YwtXI2/tracks";
//                    total = 52;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DX2oU49YwtXI2";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonce&type=playlist&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 23330;
//    };
//    tracks =     {
//        href = "https://api.spotify.com/v1/search?query=Beyonce&type=track&offset=0&limit=2";
//        items =         (
//                        {
//                album =                 {
//                    "album_type" = single;
//                    artists =                     (
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/181bsRPaVXVlUKXrxwZfHK";
//                            };
//                            href = "https://api.spotify.com/v1/artists/181bsRPaVXVlUKXrxwZfHK";
//                            id = 181bsRPaVXVlUKXrxwZfHK;
//                            name = "Megan Thee Stallion";
//                            type = artist;
//                            uri = "spotify:artist:181bsRPaVXVlUKXrxwZfHK";
//                        },
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                            };
//                            href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                            id = 6vWDO969PvNqNYHIOW5v0m;
//                            name = "Beyonc\U00e9";
//                            type = artist;
//                            uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                        }
//                    );
//                    "available_markets" =                     (
//                        AD,
//                        AE,
//                        AG,
//                        AL
//                    );
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/album/6M4VOF1ExBRii1x20Pk0GR";
//                    };
//                    href = "https://api.spotify.com/v1/albums/6M4VOF1ExBRii1x20Pk0GR";
//                    id = 6M4VOF1ExBRii1x20Pk0GR;
//                    images =                     (
//                                                {
//                            height = 640;
//                            url = "https://i.scdn.co/image/ab67616d0000b273cd613f53a22b92b14694943c";
//                            width = 640;
//                        },
//                                                {
//                            height = 300;
//                            url = "https://i.scdn.co/image/ab67616d00001e02cd613f53a22b92b14694943c";
//                            width = 300;
//                        },
//                                                {
//                            height = 64;
//                            url = "https://i.scdn.co/image/ab67616d00004851cd613f53a22b92b14694943c";
//                            width = 64;
//                        }
//                    );
//                    name = "Savage Remix (feat. Beyonc\U00e9)";
//                    "release_date" = "2020-04-29";
//                    "release_date_precision" = day;
//                    "total_tracks" = 1;
//                    type = album;
//                    uri = "spotify:album:6M4VOF1ExBRii1x20Pk0GR";
//                };
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/181bsRPaVXVlUKXrxwZfHK";
//                        };
//                        href = "https://api.spotify.com/v1/artists/181bsRPaVXVlUKXrxwZfHK";
//                        id = 181bsRPaVXVlUKXrxwZfHK;
//                        name = "Megan Thee Stallion";
//                        type = artist;
//                        uri = "spotify:artist:181bsRPaVXVlUKXrxwZfHK";
//                    },
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL
//                );
//                "disc_number" = 1;
//                "duration_ms" = 242000;
//                explicit = 1;
//                "external_ids" =                 {
//                    isrc = QMCE32000145;
//                };
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/track/5v4GgrXPMghOnBBLmveLac";
//                };
//                href = "https://api.spotify.com/v1/tracks/5v4GgrXPMghOnBBLmveLac";
//                id = 5v4GgrXPMghOnBBLmveLac;
//                "is_local" = 0;
//                name = "Savage Remix (feat. Beyonc\U00e9)";
//                popularity = 78;
//                "preview_url" = "https://p.scdn.co/mp3-preview/82b86052d5cfa3802d47b4ee63036d2bfeb86525?cid=3d2408433c5e46aa8edb5aedd1a4f96e";
//                "track_number" = 1;
//                type = track;
//                uri = "spotify:track:5v4GgrXPMghOnBBLmveLac";
//            },
//                        {
//                album =                 {
//                    "album_type" = album;
//                    artists =                     (
//                                                {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                            };
//                            href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                            id = 6vWDO969PvNqNYHIOW5v0m;
//                            name = "Beyonc\U00e9";
//                            type = artist;
//                            uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                        }
//                    );
//                    "available_markets" =                     (
//                        AD,
//                        AE,
//                        AG,
//                        AL
//                    );
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/album/6oxVabMIqCMJRYN1GqR3Vf";
//                    };
//                    href = "https://api.spotify.com/v1/albums/6oxVabMIqCMJRYN1GqR3Vf";
//                    id = 6oxVabMIqCMJRYN1GqR3Vf;
//                    images =                     (
//                                                {
//                            height = 640;
//                            url = "https://i.scdn.co/image/ab67616d0000b27345680a4a57c97894490a01c1";
//                            width = 640;
//                        },
//                                                {
//                            height = 300;
//                            url = "https://i.scdn.co/image/ab67616d00001e0245680a4a57c97894490a01c1";
//                            width = 300;
//                        },
//                                                {
//                            height = 64;
//                            url = "https://i.scdn.co/image/ab67616d0000485145680a4a57c97894490a01c1";
//                            width = 64;
//                        }
//                    );
//                    name = "Dangerously In Love";
//                    "release_date" = "2003-06-24";
//                    "release_date_precision" = day;
//                    "total_tracks" = 15;
//                    type = album;
//                    uri = "spotify:album:6oxVabMIqCMJRYN1GqR3Vf";
//                };
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
//                        };
//                        href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
//                        id = 6vWDO969PvNqNYHIOW5v0m;
//                        name = "Beyonc\U00e9";
//                        type = artist;
//                        uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
//                    },
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/3nFkdlSjzX9mRTtwJOzDYB";
//                        };
//                        href = "https://api.spotify.com/v1/artists/3nFkdlSjzX9mRTtwJOzDYB";
//                        id = 3nFkdlSjzX9mRTtwJOzDYB;
//                        name = "JAY-Z";
//                        type = artist;
//                        uri = "spotify:artist:3nFkdlSjzX9mRTtwJOzDYB";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG,
//                    AL
//                );
//                "disc_number" = 1;
//                "duration_ms" = 236133;
//                explicit = 0;
//                "external_ids" =                 {
//                    isrc = USSM10305425;
//                };
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/track/5IVuqXILoxVWvWEPm82Jxr";
//                };
//                href = "https://api.spotify.com/v1/tracks/5IVuqXILoxVWvWEPm82Jxr";
//                id = 5IVuqXILoxVWvWEPm82Jxr;
//                "is_local" = 0;
//                name = "Crazy In Love (feat. Jay-Z)";
//                popularity = 78;
//                "preview_url" = "https://p.scdn.co/mp3-preview/ce8ace0ec425840416be78db07cf50dd331eed4f?cid=3d2408433c5e46aa8edb5aedd1a4f96e";
//                "track_number" = 1;
//                type = track;
//                uri = "spotify:track:5IVuqXILoxVWvWEPm82Jxr";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/search?query=Beyonce&type=track&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 6448;
//    };
//}

