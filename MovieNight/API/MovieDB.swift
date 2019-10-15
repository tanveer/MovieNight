//
//  MovieDB.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 7/2/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import UIKit

private let baseUrl = "https://api.themoviedb.org/3/movie/"
private let apiKey = "5674ba82c361b08cdb6c62d452c1e90d"
private let discoverUrl = "https://api.themoviedb.org/3/discover/movie?api_key=5674ba82c361b08cdb6c62d452c1e90d&language=en-US&include_adult=false&include_video=false"
private let posterUrl = "https://image.tmdb.org/t/p/original"
private let decoder = JSONDecoder()


class MovieDB {
    private let session = URLSession(configuration: .default)

    class func getPopularMovies(page: Int, _ query: String = "popular", onSuccess: @escaping (Movies) -> ()) {
        let urlStr = "\(baseUrl)\(query)?api_key=\(apiKey)&region=US&adult=false&page=\(page)"
        guard let url = URL(string: urlStr) else {
            print("not able to make url")
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else {
                print("enountered an error")
                return
            }

            do {
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(movies)
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }

    class func getNowPlayingMovies(_ query: String = "now_playing", onSuccess: @escaping (Movies) -> ()) {
        let urlStr = "\(baseUrl)\(query)?api_key=\(apiKey)&region=US&adult=false"
        guard let url = URL(string: urlStr) else {
            print("not able to make url")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                print("enountered an error")
                return
            }

            do {
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(movies)
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }

    class func topRatedMovies(_ query: String = "top_rated", onSuccess: @escaping (Movies) -> ()) {
         let urlStr = "\(baseUrl)\(query)?api_key=\(apiKey)&region=US&adult=false"
         guard let url = URL(string: urlStr) else {
             print("not able to make url")
             return
         }
         URLSession.shared.dataTask(with: url) { (data, response, error) in
             guard error == nil, let data = data else {
                 print("enountered an error")
                 return
             }

             do {
                 decoder.keyDecodingStrategy = .convertFromSnakeCase
                 let movies = try decoder.decode(Movies.self, from: data)
                 DispatchQueue.main.async {
                     onSuccess(movies)
                 }
             }
             catch {
                 print(error)
             }
         }.resume()
     }

    class func upcomingMovies(_ query: String = "upcoming", onSuccess: @escaping (Movies) -> ()) {
        let urlStr = "\(baseUrl)\(query)?api_key=\(apiKey)&region=US&adult=false"
        guard let url = URL(string: urlStr) else {
            print("not able to make url")
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                print("enountered an error")
                return
            }

            do {
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    print(movies)
                    onSuccess(movies)
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }


}
