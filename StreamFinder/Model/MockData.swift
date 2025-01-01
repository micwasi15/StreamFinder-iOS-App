import SwiftUI

struct MockData {
    static let shows = [
        Show(
            apiId: 1,
            title: "Friends",
            yearRange: "1994-2004",
            posterURL: "hhttps://cdn.movieofthenight.com/show/1/poster/vertical/en/240.jpg?Expires=1749515751&Signature=MxXk6yMlUav54Vs5R1Nm-tUK6aAoAX3AEvsLfAnEMAZ-~MXJCgA-1w6U2nj~AEEXiK9eFg7slp6mB4Af9owSnZOmDlIau-H1p~6OCOjkqiC64tRsvm3Ro9pskQKCyy4H-fJR~w10-lzDpznxyywR-NtpKawntWrvkwOxcLWpoWPFm~LraTA0QBfhNtywU2jR217YlYiHlgSQI~0Lz8ZOnPt46fTqBKFfYiBBLMjUaLqkkSePcP~UWX-qn07Ogsc8JkYStzgJDAWgpnoisVZj6DLrCwaANkx5FJ2pVdGGwckElYr4oWy-YUe2pBFEPdnv1xF6tMv474OqSID-V31H9g__&Key-Pair-Id=KK4HN3OO4AT5R",
            showType: .series
        ),
        Show(
            apiId: 132,
            title: "Back to the Future",
            yearRange: "1985",
            posterURL: "https://cdn.movieofthenight.com/show/132/poster/horizontal/en/360.jpg?Expires=1749513583&Signature=ItDrN1-Xkm3OkscKo8j44cBbMvGamEW46uPbOgjgy919P5k~9iDSwObcQHWcJI3K84tCcDoqWGhPQ4-limd~HGVrgZebtlt1fK9uohUShuD6iM~teHWcMepm-AZ~RcMZl5Vn7Uum-t8Fqa9n84qJgUdFBsjEK-wIIooMZfY33H7N0bIwB6A1HtzvLlOt9nAMfMG5eAE2IceFnGTWAbEJQhVl4LJne2xM5TH5bFDfYL~RED6XAoP68sq840eblc0gtMoH5ZCLBm23VJMi1dErLiUwac~3iVnPFFtuGq~H1n8n2Q6aCB-qSVgk0HpKD75sZXBLhwLl435vZ7TdBs~EXA__&Key-Pair-Id=KK4HN3OO4AT5R",
            showType: .movie
        ),
        Show(
            apiId: 132,
            title: "Back to the Future",
            yearRange: "1985",
            posterURL: "https://cdn.movieofthenight.com/show/132/poster/horizontal/en/360.jpg?Expires=1749513583&Signature=ItDrN1-Xkm3OkscKo8j44cBbMvGamEW46uPbOgjgy919P5k~9iDSwObcQHWcJI3K84tCcDoqWGhPQ4-limd~HGVrgZebtlt1fK9uohUShuD6iM~teHWcMepm-AZ~RcMZl5Vn7Uum-t8Fqa9n84qJgUdFBsjEK-wIIooMZfY33H7N0bIwB6A1HtzvLlOt9nAMfMG5eAE2IceFnGTWAbEJQhVl4LJne2xM5TH5bFDfYL~RED6XAoP68sq840eblc0gtMoH5ZCLBm23VJMi1dErLiUwac~3iVnPFFtuGq~H1n8n2Q6aCB-qSVgk0HpKD75sZXBLhwLl435vZ7TdBs~EXA__&Key-Pair-Id=KK4HN3OO4AT5R",
            showType: .movie
        ),
        Show(
            apiId: 132,
            title: "Back to the Future",
            yearRange: "1985",
            posterURL: "https://cdn.movieofthenight.com/show/132/poster/horizontal/en/360.jpg?Expires=1749513583&Signature=ItDrN1-Xkm3OkscKo8j44cBbMvGamEW46uPbOgjgy919P5k~9iDSwObcQHWcJI3K84tCcDoqWGhPQ4-limd~HGVrgZebtlt1fK9uohUShuD6iM~teHWcMepm-AZ~RcMZl5Vn7Uum-t8Fqa9n84qJgUdFBsjEK-wIIooMZfY33H7N0bIwB6A1HtzvLlOt9nAMfMG5eAE2IceFnGTWAbEJQhVl4LJne2xM5TH5bFDfYL~RED6XAoP68sq840eblc0gtMoH5ZCLBm23VJMi1dErLiUwac~3iVnPFFtuGq~H1n8n2Q6aCB-qSVgk0HpKD75sZXBLhwLl435vZ7TdBs~EXA__&Key-Pair-Id=KK4HN3OO4AT5R",
            showType: .movie
        ),
        Show(
            apiId: 132,
            title: "Back to the Future",
            yearRange: "1985",
            posterURL: "https://cdn.movieofthenight.com/show/132/poster/horizontal/en/360.jpg?Expires=1749513583&Signature=ItDrN1-Xkm3OkscKo8j44cBbMvGamEW46uPbOgjgy919P5k~9iDSwObcQHWcJI3K84tCcDoqWGhPQ4-limd~HGVrgZebtlt1fK9uohUShuD6iM~teHWcMepm-AZ~RcMZl5Vn7Uum-t8Fqa9n84qJgUdFBsjEK-wIIooMZfY33H7N0bIwB6A1HtzvLlOt9nAMfMG5eAE2IceFnGTWAbEJQhVl4LJne2xM5TH5bFDfYL~RED6XAoP68sq840eblc0gtMoH5ZCLBm23VJMi1dErLiUwac~3iVnPFFtuGq~H1n8n2Q6aCB-qSVgk0HpKD75sZXBLhwLl435vZ7TdBs~EXA__&Key-Pair-Id=KK4HN3OO4AT5R",
            showType: .movie
        ),
        Show(
            apiId: 212,
            title: "Monsters Inc",
            yearRange: "2001",
            posterURL: "https://cdn.movieofthenight.com/show/212/poster/horizontal/en/360.jpg?Expires=1749507764&Signature=Zc7nT6SqggsU9gLKOCro3V7NBKo-0bic7TPYUJbUD~6hBTaDE0CsIMnLb4nY3rG604BeK5pKcBt2z3c3hA28mAaHvkaGZc77rINjDtqbxQdOO9u~HxxriLZlc0mPtiLzkMhrAujeAez2UJTXUQraNOGDVI~ND9LeM118slDIxDJPB-c2-I4Cm7VZDZ3Mwcv18CENOxczCJiT0jc1fM7844-Qn959oaJgK99znTSsQJWFRnsbe4AU-lJaPHeiLmgXMNV0A1APgINuk6LuW-ZInYgJSww6ug-csjUJOBHkFR3CUNQrpv5Hmp3XPTxlgB9jsgxTXMjOTXpz5BP2VyYw2g__&Key-Pair-Id=KK4HN3OO4AT5R",
            showType: .movie
        ),
    ]
    
    static let articles = [
        Article(
            apiId: 1,
            title: "Tytuł artykułu",
            imageURL: "https://phenixcitylibrary.com/wp-content/uploads/2017/06/Movie-Night.jpg",
            body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
    ]

    static let news = [
        News(
            apiId: 1,
            title: "Tytuł artykułu",
            imageURL: "https://phenixcitylibrary.com/wp-content/uploads/2017/06/Movie-Night.jpg"
        ),
        News(
            apiId: 2,
            title: "Tytul2",
            imageURL: "https://cdn.movieofthenight.com/show/212/poster/horizontal/en/360.jpg?Expires=1749507764&Signature=Zc7nT6SqggsU9gLKOCro3V7NBKo-0bic7TPYUJbUD~6hBTaDE0CsIMnLb4nY3rG604BeK5pKcBt2z3c3hA28mAaHvkaGZc77rINjDtqbxQdOO9u~HxxriLZlc0mPtiLzkMhrAujeAez2UJTXUQraNOGDVI~ND9LeM118slDIxDJPB-c2-I4Cm7VZDZ3Mwcv18CENOxczCJiT0jc1fM7844-Qn959oaJgK99znTSsQJWFRnsbe4AU-lJaPHeiLmgXMNV0A1APgINuk6LuW-ZInYgJSww6ug-csjUJOBHkFR3CUNQrpv5Hmp3XPTxlgB9jsgxTXMjOTXpz5BP2VyYw2g__&Key-Pair-Id=KK4HN3OO4AT5R"
        ),
        News(
            apiId: 3,
            title: "Tytul3",
            imageURL: "https://cdn.movieofthenight.com/show/212/poster/horizontal/en/360.jpg?Expires=1749507764&Signature=Zc7nT6SqggsU9gLKOCro3V7NBKo-0bic7TPYUJbUD~6hBTaDE0CsIMnLb4nY3rG604BeK5pKcBt2z3c3hA28mAaHvkaGZc77rINjDtqbxQdOO9u~HxxriLZlc0mPtiLzkMhrAujeAez2UJTXUQraNOGDVI~ND9LeM118slDIxDJPB-c2-I4Cm7VZDZ3Mwcv18CENOxczCJiT0jc1fM7844-Qn959oaJgK99znTSsQJWFRnsbe4AU-lJaPHeiLmgXMNV0A1APgINuk6LuW-ZInYgJSww6ug-csjUJOBHkFR3CUNQrpv5Hmp3XPTxlgB9jsgxTXMjOTXpz5BP2VyYw2g__&Key-Pair-Id=KK4HN3OO4AT5R"
        )
    ]
    
    static let films = [Film]()

    static let streamingOptions:[String: [StreamingOption]] = [
        Country.us.rawValue: [StreamingOption(service: .netflix, url: "sfdd")]
    ]
    static let streamingOptions1:[String: [StreamingOption]] = [
        Country.rs.rawValue: [StreamingOption(service: .netflix, url: "sfdd")]
    ]
    
    static let series = [Series]()
}
