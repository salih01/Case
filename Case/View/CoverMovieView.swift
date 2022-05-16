//
//  CoverMovieView.swift
//  Case
//
//  Created by Salih Çakmak on 16.05.2022.
//

import SwiftUI

struct CoverMovieView: View {
    let title:String
    let movies: [Movie]
    @State var show = false
    
    var body: some View {
      TabView {
          ForEach(self.movies) { movie in
              Card(movie: movie)
                  .frame(maxWidth : screen.width , maxHeight: 400)
                  .cornerRadius(10)
              

        } //: LOOP
      } //: TAB
      .tabViewStyle(PageTabViewStyle())
      .frame(maxWidth : show ? .infinity :screen.width , maxHeight: 400)
        
        
    }
}

struct CoverMovieView_Previews: PreviewProvider {
    static var previews: some View {
        CoverMovieView(title: "title", movies: Movie.stubbedMovies)
    }
}
