//
//  URLImage.swift
//  MovieProject
//
//  Created by Saruar Jahan on 16/2/24.
//

import Foundation
import SwiftUI

struct URLImage: View {
    // URL of the image
    var url: URL?
    init(url: URL? ) {
        self.url = url
        print(self.url)
    }
    var body: some View {
        if let url = url {
            // Load the image asynchronously from the provided URL
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    // If the image is loaded successfully, display it
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure(let error):
                    // If there's an error loading the image, display a placeholder or an error message
                    Text("Failed to load image: \(error.localizedDescription)")
                case .empty:
                    Text("No image")
                    
                @unknown default:
                    Text("unknown error")
                }
            }
            .frame(width: 100, height: 200)
            .padding()
        } else {
           Image("placeholderImage")
                .frame(width: 50, height: 50)

        }
    }
}
