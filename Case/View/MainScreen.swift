//
//  MainScreen.swift
//  Case
//
//  Created by Salih Çakmak on 16.05.2022.
//

import SwiftUI

struct MainScreen: View {
@State var show = false
    var body: some View {
        NavigationView {
            List{
                CoverMovieView(title: "title", movies: Movie.stubbedMovies)
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }

        }
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            //.previewLayout(.fixed(width: 400, height: 300))
    }
}
