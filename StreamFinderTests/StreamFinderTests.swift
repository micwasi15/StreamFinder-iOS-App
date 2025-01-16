//
//  StreamFinderTests.swift
//  StreamFinderTests
//
//  Created by stud on 16/01/2025.
//

import XCTest
@testable import StreamFinder


final class LoginDataValidatorTests: XCTestCase {
    func testValidateEmail() {
        XCTAssertTrue(LoginDataValidator.validateEmail(email: "john@gmail.com"))
        XCTAssertFalse(LoginDataValidator.validateEmail(email: "john"))
    }

    func testValidatePassword() {
        XCTAssertTrue(LoginDataValidator.validatePassword(password: "12345678"))
        XCTAssertFalse(LoginDataValidator.validatePassword(password: "12345"))
    }
}


final class DataParsingTests: XCTestCase {
    func testParseFilmFromJson() {
        let json = """
        {
            "id": 1,
            "title": "The Shawshank Redemption",
            "releaseYear": 1994,
            "trailerURL": "https://www.youtube.com/watch?v=6hB3S9bIaco",
            "genre": "Drama",
            "director": "Frank Darabont",
            "actors": ["Tim Robbins", "Morgan Freeman"],
            "rating": 9.3,
            "streamingOptions": {
                "us": [
                    {
                        "service": {
                            "id": "netflix",
                            "name": "Netflix"
                        },
                        "link": "https://www.netflix.com/title/70005379"
                    },
                    {
                        "service": {
                            "id": "hulu",
                            "name": "Hulu"
                        },
                        "link": "https://www.hulu.com/movie/the-shawshank-redemption-3ae6a2f1-1b1b-4b82-9b4c-0f1e9b8f9f9b"
                    }
                ],
                "uk": [
                    {
                        "service": {
                            "id": "amazon",
                            "name": "Amazon Prime Video"
                        },
                        "link": "https://www.amazon.co.uk/The-Shawshank-Redemption-Tim-Robbins/dp/B00FZIYHTK"
                    }
                ]
            },
            "overview": "Two imprisoned...",
            "imageSet": {
                "horizontalPoster": {
                    "w480": "https://www.example.com/image.jpg"
                }
            }
        }
        """

        let jsonData = json.data(using: .utf8)!
        let film = try! JSONDecoder().decode(Film.self, from: jsonData)

        XCTAssertNotNil(film)
    }
}


final class SearchViewModelTests: XCTestCase {
    func testEmptySearch() {
        let viewModel = SearchViewModel()
        viewModel.searchText = ""
        viewModel.searchShows()

        XCTAssertEqual(viewModel.shows.count, 0)
        XCTAssertFalse(viewModel.isLoading)
    }
}


final class SortCountriesTests: XCTestCase {
    func testPrefferedCountries() {
        let countries = [
            Country.us.rawValue,
            Country.es.rawValue,
            Country.gb.rawValue,
            Country.fr.rawValue,
            Country.de.rawValue,
            Country.it.rawValue
        ]

        let sortedCountries: [String] = Country.getPreffered(countries: countries, preffered: .it)

        XCTAssertEqual(sortedCountries, [
            Country.it.rawValue,
            Country.us.rawValue,
            Country.gb.rawValue,
            Country.de.rawValue,
            Country.es.rawValue,
            Country.fr.rawValue
        ])
    }
}

