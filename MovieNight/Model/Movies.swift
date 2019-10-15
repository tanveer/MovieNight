//
//  Movies.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 7/2/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation



struct Movies: Codable {
    let page: Int
    let totalResults: Int?
    let totalPages: Int?
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    let voteCount: Int
    let id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String?
    let originalLanguage: String
    let originalTitle: String
//    let genreIds: []
    let backdropPath: String?
    let adult: Bool
    let overview: String
}
