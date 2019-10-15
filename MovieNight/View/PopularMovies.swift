//
//  PopularMovies.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/15/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct PopularMovies: View {
    @ObservedObject var data = MovieDataViewModel()

    var body: some View {
       List {
            ForEach(data.movies) { movie in
                HStack {
                    ImageView(movie.posterPath)
                    Text(movie.overview).lineLimit(3)
                }
            }
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovies()
    }
}
