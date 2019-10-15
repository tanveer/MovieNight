//
//  NowPlayingMovieDataModel.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/15/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NowPlayingMovieDataModel: ObservableObject {
    @Published var nowPlaying: [Movie] = []

    init() {
        self.fetchNowPlaying()
    }

    private func fetchNowPlaying() {
        MovieDB.getNowPlayingMovies{
            self.nowPlaying = $0.results
        }
    }
}
