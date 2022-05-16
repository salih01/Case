//
//  MovieCardList.swift
//  Case
//
//  Created by Salih Çakmak on 16.05.2022.
//

import SwiftUI

struct MovieBackdropCarouselView: View {
    
    let title: String
    let movies: [Movie]
    var thumbnailType: Card = .init(movie: Movie.stubbedMovie)

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(20)
            NavigationView{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                        ForEach(self.movies) { movie in
                            NavigationLink(destination:
                                            MovieDetailView(movieId: Movie.stubbedMovie.id, movieTitle: "")
                            ) {
                                HStack {
                                    Card(movie: movie)
                                        .frame(width: 170, height: 150)
                                        .cornerRadius(30)
                                        .shadow(radius: 20)
                                    VStack(alignment:.leading) {
                                        Text(movie.title)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                            .padding(.trailing,10)
                                            .padding(.bottom,5)
                                    
                                    }
                                   
                                    .frame(width: 180 , height: 90)
                                    }
                                .buttonStyle(.plain)

                                    
                            }
                           
                            
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                        
                    }
                }
            }
  
        }
    }
}

struct MovieBackdropCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCarouselView(title: "For you", movies: Movie.stubbedMovies)
    }
}
