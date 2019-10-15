//
//  TestData.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 7/2/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation

class TestMovieData {
     class func movieData() -> Movies? {

        guard let data = TestData else {
            print("No data found")
            fatalError()
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            return try decoder.decode(Movies.self, from: data)
        } catch {

        }
        return nil
    }
}

let TestData = """
{
        "page": 1,
        "total_results": 19814,
        "total_pages": 991,
        "results": [
                    {
                        "vote_count": 751,
                        "id": 301528,
                        "video": false,
                        "vote_average": 7.7,
                        "title": "Toy Story 4",
                        "popularity": 313.97,
                        "poster_path": "/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg",
                        "original_language": "en",
                        "original_title": "Toy Story 4",
                        "genre_ids": [
                        12,
                        16,
                        35,
                        10751
                        ],
                        "backdrop_path": "/m67smI1IIMmYzCl9axvKNULVKLr.jpg",
                        "adult": false,
                        "overview": "Woody has always been confident about his place in the world and that his priority is taking care of his kid, whether that's Andy or Bonnie. But when Bonnie adds a reluctant new toy called \"Forky\" to her room, a road trip adventure alongside old and new friends will show Woody how big the world can be for a toy.",
                        "release_date": "2019-06-21"
                    }]

}
""".data(using: .utf8)
