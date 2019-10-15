//
//  TopRatedMoviesViewModel.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/15/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct TopRatedMovies: View {
    @ObservedObject var data = TopRatedMoviesViewModel()

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

struct TopRatedMoviesViewModel_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedMovies()
    }
}
