//
//  ImageView.swift
//  MovieNight
//
//  Created by Tanveer Bashir on 7/2/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

private let posterBaseUrl = "https://image.tmdb.org/t/p/original"

class ImageLoader: ObservableObject {
    @Published var downloadedImage: UIImage?

    func load(_ poster: String = "") {
        let iconUrl = "\(posterBaseUrl)\(poster)"

        guard let imgUrl = URL(string: iconUrl) else {
            print("Bad url")
            return
        }
        URLSession.shared.dataTask(with: imgUrl) { (data, _, error) in
            guard let data = data , error == nil else {
                self.downloadedImage = nil
                return
            }
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
            }
        }.resume()
    }
}

struct ImageView: View {
    var placeholder: Image
    var width: CGFloat = 0
    var height: CGFloat = 0

    @ObservedObject var imageLoader = ImageLoader()

    init(_ url: String?, placeholder: Image = Image(systemName: "photo"), width: CGFloat =  ImageBounds.width, height: CGFloat = ImageBounds.height) {
        self.placeholder = placeholder
        guard let url = url else { return }
        self.imageLoader.load(url)
        self.width = width
        self.height = height
    }

    var body: some View {
        if let image = imageLoader.downloadedImage {
            return Image(uiImage: image)
                .resizable()
                .frame(width: self.width, height: self.height)
        } else {
            return placeholder
                .resizable()
                .frame(width: self.width, height: self.height)
        }
    }
}
    
struct ImageBounds {
    static var width: CGFloat = 96
    static var height: CGFloat = 145
}
