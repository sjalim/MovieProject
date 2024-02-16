//
//  ContentView.swift
//  MovieProject
//
//  Created by Saruar Jahan on 16/2/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationStack {
            
        List(viewModel.movies, id: \.id) { movie in
            
            MovieCardView(image: movie.posterPath, title: movie.title, desc: movie.overview)
        }
        
        .listStyle(.plain)
        .navigationTitle("MovieList")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getAllMoviesData()
        }
        
        }
    }
}

#Preview {
    MovieListView()
}
