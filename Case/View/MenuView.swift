//
//  MenuView.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import SwiftUI

struct MenuView: View {
    let title:String
    let movie: Movie
    let movies: [Movie]
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var movieDetailState = MovieDetailState()

    
    var body: some View {
        ScrollView{
            VStack{
              
                CoverMovieView(title: title, movies: Movie.stubbedMovies)
                    .frame(height: 300, alignment: .center)
                    .offset(y:-50)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(30)
                MovieBackdropCarouselView(title: "", movies: Movie.stubbedMovies)
          
            
            }
            .frame(width: 410, height: 1200, alignment: .center)
        }
       
    }
}
            //.frame(width:390)
           
       
    


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(title: "title", movie: Movie.stubbedMovie, movies: Movie.stubbedMovies)
            .edgesIgnoringSafeArea(.all)

    }
}
