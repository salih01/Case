//
//  Card.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import SwiftUI

struct Card: View {
    
    enum MovieThumbnailType {
        case poster(showTitle: Bool = true)
        case backdrop
    }

    let movie: Movie
    @StateObject var imageLoader = ImageLoader()
    var thumbnailType: MovieThumbnailType = .poster()

    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                }
                HStack {
                    Text(movie.title)
                        .font(.system(size: 20 , weight: .bold))
                        .frame(width: 300)
                        .foregroundColor(Color.white)
                        //.padding()
                }
                .offset(x:-100,y:20)
                .frame(width: 170 , height: 150,alignment: .bottomLeading)
                
            }
            .aspectRatio(16/9, contentMode: .fill)
            .cornerRadius(8)
            .shadow(radius: 4)
            
           
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}



struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(movie: Movie.stubbedMovie,thumbnailType: .poster(showTitle: true))
    }
}
