//
//  MainView.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 7/3/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct MainView : View {
    @ObservedObject var dataModel = MovieDataViewModel()

    var body: some View {
        List {
            ForEach(dataModel.movies, id: \.title) { movie in
                Text(movie.title)
            }
        }
    }
}
