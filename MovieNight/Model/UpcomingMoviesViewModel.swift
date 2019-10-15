//
//  UpcomingMoviesViewModel.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/15/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class UpcomingMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    init() {
        self.fetchUpcomingMovies()
    }

    private func fetchUpcomingMovies() {
        MovieDB.upcomingMovies {
            self.movies = $0.results
        }
    }
}
