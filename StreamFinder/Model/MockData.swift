import SwiftUI

struct MockData {
    static let shows = [
        Show(
            apiId: 1,
            title: "Friends",
            yearRange: "1994-2004",
            posterURL: "https://cdn.movieofthenight.com/show/1/poster/vertical/en/240.jpg?Expires=1749515751&Signature=MxXk6yMlUav54Vs5R1Nm-tUK6aAoAX3AEvsLfAnEMAZ-~MXJCgA-1w6U2nj~AEEXiK9eFg7slp6mB4Af9owSnZOmDlIau-H1p~6OCOjkqiC64tRsvm3Ro9pskQKCyy4H-fJR~w10-lzDpznxyywR-NtpKawntWrvkwOxcLWpoWPFm~LraTA0QBfhNtywU2jR217YlYiHlgSQI~0Lz8ZOnPt46fTqBKFfYiBBLMjUaLqkkSePcP~UWX-qn07Ogsc8JkYStzgJDAWgpnoisVZj6DLrCwaANkx5FJ2pVdGGwckElYr4oWy-YUe2pBFEPdnv1xF6tMv474OqSID-V31H9g__&Key-Pair-Id=KK4HN3OO4AT5R",
            ShowType: .series
        ),
        Show(
            apiId: 132,
            title: "Back to the Future",
            yearRange: "1985",
            posterURL: "https://cdn.movieofthenight.com/show/132/poster/vertical/en/240.jpg?Expires=1749513581&Signature=J37AepOIWNOhUxUVDcKQm41Hd1aO4gIoNmDcqI10QoWieJAgCv8B~rWgYVrC5yieUrwJg9Udb1MHBeQfsLlz-v2gXiVqgIuPkE6Jnxn9j7kj4hK2sqca3eRP7pqbPkO~JkGJoIiuGV5ZcDaKoqyAXRBeB12-eV7LWawFHBfavMVarQUf6oq6qj82THlBY1TBWg5Yn8UqGlj6Z~orixSpKqNDaV9AFKL2r9jUqjD1v6aijF7TL7DC66bpNqlwd-Xce0Uj3cyDzKvbhFUno2IquZxFI5LxqLmJj8iN5-dEzQ67~tKIUvbkElNE6ffEVT~7HMdRMDVxpehJ~hGBEgz13A__&Key-Pair-Id=KK4HN3OO4AT5R"
            ShowType: .movie
        )
        Show(
            apiId: 212,
            title: "Monsters Inc",
            yearRange: "2001",
            posterURL: "https://cdn.movieofthenight.com/show/212/poster/vertical/en/240.jpg?Expires=1749507762&Signature=WLsO4yvTla0KoKOe3YHqYdmd-XZOvcnxiYS~Bm4~7sNzOfJ6ehc9ZYTW73aPTAATytG88rLPnWzQWdKW-2jVmHdO7E5dqGyM5bK1fXzsaAQcinFe61LXg1IH1fxixX6DkYfTjuaNCWj~yLI~U-jsfVpEtkfqLHr8giNCjmbd-707rmzy7KkJQu~XA57DYEcrX1y3~2mz4TiL2vbxfjdiCyVoB07ZE~bv6mEOQDHaeC6Wv26b4KDhab41gsCST8AORtncYKSU8B0fXmhMLbm3X~WMHrQO3Ii2H5hirovslOc2bosxkvsPp9nZ4NnQ3v-usV1Wu0Z8jro5yq6nDUtxlA__&Key-Pair-Id=KK4HN3OO4AT5R",
            ShowType: .movie
        )
    ]
    static let news = [
        Article(
            title: "Tytuł artykułu",
            description: "Opis artykułu",
            imageURL: "https://via.placeholder.com/150",
            body: "Treść artykułu"
        )
    ]
}