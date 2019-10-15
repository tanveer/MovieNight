//
//  TopRatedMoviesViewModel.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/15/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TopRatedMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    init() {
        self.fetchTopRatedMovies()
    }

    private func fetchTopRatedMovies() {
        MovieDB.topRatedMovies {
            self.movies = $0.results
        }
    }
}
