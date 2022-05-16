//
//  NavigationMovie.swift
//  Case
//
//  Created by Salih Çakmak on 16.05.2022.
//

import SwiftUI

struct NavigationMovie: View {
    let title:String
    let movies: [Movie]
    let movie: Movie
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var movieDetailState = MovieDetailState()

    var body: some View {
        NavigationView{
             
                List {
                    ForEach(self.movies) { movie in
                        
                        HStack {
                            ForEach(self.movies) { movie in
                                Card(movie: movie)
                                    .frame(maxWidth : screen.width , maxHeight: 400)
                                    .cornerRadius(10)
                            VStack(alignment:.leading) {
                                Text(movie.title)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .padding(.trailing,10)
                                    .padding(.bottom,5)
                                
                                Text(movies.description)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .foregroundColor(.secondary)
                                    .padding(.trailing,8)
                            }
                            .frame(width: 180 , height: 90)
                            }
                                

                  }
                    }
                }
                .offset(y:-70)
        
            }
}
}

struct NavigationMovie_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMovie(title: "title", movies: Movie.stubbedMovies, movie: Movie.stubbedMovie)
    }
}
