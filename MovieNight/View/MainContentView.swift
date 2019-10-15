//
//  MoviesView.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 10/11/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI
import Combine

struct MainContentView: View {
//    @ObservedObject var data = MovieDataViewModel()
    @State private var page: Int = 1

    var body: some View {
        TabView{
            NowPlayingMovies().tabItem({
                VStack{
                    Text("In Theater")
                }
            }).tag(0)

            PopularMovies().tabItem({
                VStack{
                    Text("Popular")
                }
            }).tag(1)

            UpcomingMovies().tabItem{
                VStack{
                    Text("Upcoming")
                }
            }.tag(2)

            TopRatedMovies().tabItem {
                VStack{
                    Text("Top Rated")
                }
            }.tag(3)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
