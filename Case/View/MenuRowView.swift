//
//  MenuRowView.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import SwiftUI

struct MenuRowView: View {
    let title:String
    let movies: [Movie]
    let movie: Movie

    @ObservedObject var imageLoader = ImageLoader()


    var body: some View {
        
        HStack {
            Card(movie: Movie.stubbedMovie)
            
                .frame(width: 170, height: 150)
                .cornerRadius(15)
                .shadow(radius: 20)
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


struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(title: "title", movies: Movie.stubbedMovies, movie: Movie.stubbedMovie)    }
}
