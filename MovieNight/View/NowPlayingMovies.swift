//
//  NowPlayingMovies.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/13/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct NowPlayingMovies: View {

    @ObservedObject var data = NowPlayingMovieDataModel()
    
    var body: some View {
        List {
            ForEach(data.nowPlaying) { movie in
                HStack {
                    ImageView(movie.posterPath)
                    Text(movie.overview).lineLimit(3)
                }
            }
        }
    }
}
