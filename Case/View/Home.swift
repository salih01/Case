//
//  Home.swift
//  Case
//
//  Created by Salih Çakmak on 14.05.2022.
//

import SwiftUI

struct Home: View {
    @State   var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false

    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            HomeView(showProfile: $showProfile, showContent: $showContent)
            .padding(.top,44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height/10)-10 : 0), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
                
         //   MenuView()
                .background(Color.black.opacity(0.000001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged{    value in
                        self.viewState = value.translation
                    }
                    .onEnded {
                        value in
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                            
                        self.viewState = .zero
                            
                        }
                
                
                    )

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct AvatarView: View {
    @Binding var showProfile : Bool
    var body: some View {
        Button(action: {self.showProfile.toggle()})
        {
            Image("imdb")
            // .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(Circle())
        }
    }
}
let screen = UIScreen.main.bounds
