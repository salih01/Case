//
//  TabBar.swift
//  Case
//
//  Created by Salih Çakmak on 16.05.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView(showProfile: .constant(false), showContent: .constant(false)).tabItem {
                Image(systemName: "house.circle.fill")
                    
                
                Text("Home")
            }
            CardDetail(row: rowData[0]).tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("For me")
            }
            MenuView(title: "title", movie: Movie.stubbedMovie, movies: Movie.stubbedMovies).tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("For You")
            }
        }
        
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 11 Pro Max")
        }
    }
}

