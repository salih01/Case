//
//  HomeView.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("TMDb")
                        .font(.system(size: 25,weight: .bold))
                    Image(systemName: "camera.fill")
                        .font(.system(size: 25,weight: .bold))
                        .padding()
                    Spacer()
                    
                   // AvatarView(showProfile: $showProfile)
                    

                    Button(action: {self.showUpdate.toggle()}){
                        Image(systemName: "person")
                            .renderingMode(.original)
                            .font(.system(size: 24,weight: .bold))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .foregroundColor(.black).opacity(0.6)
                            .clipShape(Circle())
                        
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x:0, y: 1)
                            .shadow(color: Color.black.opacity(0.6), radius: 10, x:0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate){
                        LoginView(movie: Movie.stubbedMovie)

                    }
        

                }
                .padding(.top,30)
                .padding(.leading,14)
                .padding(.horizontal)
                HStack {
                    Text("Coming Soon")
                        .font(.system(size: 25,weight: .bold))
                    Spacer()
                    Text("")
                        .font(.system(size: 25,weight: .bold))
                }
                .padding(.leading,20)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: -40) {
                        ForEach(SectionData) { item in
                            GeometryReader{ geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(
                                        degrees:
                                            Double(
                                                geometry.frame(in:.global).minX) / -20), axis:(x: 0,y: 10,z: 0))

                            }
                            .frame(width: 275, height: 275)
                        }
                        
                    }.padding(30)
                     .padding(.bottom,30)
                    
                }
         
          
         /*
                SectionView(section: SectionData[1], width: screen.width-60, height: 300)
                   .offset(y:-35)
          */
                
                CardDetail(row: rowData[0])
                    .offset(y:-35)
                    
                Spacer()
                

            }
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))    }
}

struct SectionView: View {
    var section  : Section
    
    var width: CGFloat = 275
    var height: CGFloat = 275

    var body: some View {
        ZStack {
          

            section.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200,height: 300)
                .cornerRadius(30)
                .shadow(radius: 20)
            
            HStack(alignment:.top) {
                Text(section.title)
                    .font(.system(size: 25 , weight: .bold))
                    .frame(width: 140)
                    .foregroundColor(Color.white)
                    //.padding()
            }
            .offset(y:40)
            .frame(width: 150 , height: 150,alignment: .bottomLeading)
            
            
        }
        .frame(width: width, height: height)
    }
}

struct Section: Identifiable {
    
    var id = UUID()
    var title : String
    var image : Image
}

let SectionData = [Section(title: "Iron Man", image: Image("ironman")),
                   Section(title: "MATRIX", image: Image("matrix")),
                   Section(title: "Rigs Power", image: Image("lotrdizi")),
                   Section(title: "Thor", image: Image("thor")),
                   Section(title: "Batman", image: Image("batman"))]

