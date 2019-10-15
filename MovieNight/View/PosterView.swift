//
//  PosterView.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 7/2/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct PosterView : View {
    var movies: [Movie]
    var body: some View {
        VStack{
            GeometryReader{ g in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 0){
                        ForEach(self.movies) { movie in
                            ZStack{
                                ImageView(movie.backdropPath ?? "", width: g.size.width, height: g.size.height)
//                                Text(movie.title).foregroundColor(.white).font(.system(size: 18))
                            }
                        }
                    }
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
