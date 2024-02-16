//
//  MovieCardView.swift
//  MovieProject
//
//  Created by Saruar Jahan on 16/2/24.
//

import SwiftUI

struct MovieCardView: View {
    
    let image: String?
    let title: String?
    let desc: String?
    var body: some View {
            
       
        HStack(alignment: .top) {
            URLImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(image!)"))
                           
            VStack(alignment: .leading) {
                Text(title ?? "Title")
                    .bold()
                Text(desc ?? "Description")
                    .lineLimit(10)
                
            }
        
        }
        

    }
}

#Preview {
    MovieCardView(image: "check", title: "Check", desc: "Checking Checking Checking Checking ")
}
