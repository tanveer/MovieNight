//
//  MovieDataViewModel.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/11/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class MovieDataViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    init() {
        self.fetchPopular()
    }

    func fetchPopular(_ page: Int = 1) {
        MovieDB.getPopularMovies(page: page) {
            self.movies += $0.results
        }
    }
}
